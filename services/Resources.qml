pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import "root:/utils/resources.js" as Functions

Singleton {
  id: root

  component Detail: QtObject {
    property string text
    property string unit
  }

  component Details: QtObject {
    property Detail used: Detail {}
    property Detail total: Detail {}
  }

  property QtObject cpu: QtObject {
    property real idle
    property real total
    property real percent
    property Detail details: Detail {}
  }

  property QtObject memory: QtObject {
    property real used
    property real total
    readonly property real percent: total > 0 ? used / total : 0
    property Details details: Details {}
  }

  property QtObject storage: QtObject {
    property real used
    property real total
    readonly property real percent: total > 0 ? used / total : 0
    property Details details: Details {}
  }

  property QtObject swap: QtObject {
    property real used
    property real total
    readonly property real percent: total > 0 ? used / total : 0
    property Details details: Details {}
  }

  Timer {
    running: true
    interval: 1000
    repeat: true
    onTriggered: {
      cpuStat.reload();
      cpuTemp.running = true;
      memInfo.reload();
      storage.running = true;
      swap.running = true;
    }
  }

  FileView {
    id: cpuStat

    path: "/proc/stat"

    onLoaded: {
      const regex = /^cpu\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/;
      const data = text().match(regex);

      if (data) {
        const stats = data.slice(1).map(n => parseInt(n, 10));
        const total = stats.reduce((a, b) => a + b, 0);
        const idle = stats[3];

        const totalDiff = total - root.cpu.total;
        const idleDiff = idle - root.cpu.idle;

        root.cpu.percent = totalDiff > 0 ? (1 - idleDiff / totalDiff) : 0;

        root.cpu.total = total;
        root.cpu.idle = idle;
      }
    }
  }

  Process {
    id: cpuTemp

    running: true

    command: ["sh", "-c", "cat /sys/class/thermal/thermal_zone*/temp"]

    stdout: SplitParser {
      splitMarker: ""

      onRead: data => {
        const lines = data.trim().split("\n");
        const { length: len } = lines;
        let sum = 0;

        for (const line of lines)
          sum += parseInt(line);

        root.cpu.details.text = Math.ceil((sum / len) / 1000);
        root.cpu.details.unit = "°C";
      }
    }
  }

  FileView {
    id: memInfo

    path: "/proc/meminfo"

    onLoaded: {
      const data = text();

      const total = data.match(/MemTotal: *(\d+)/)[1];
      const used = data.match(/MemAvailable: *(\d+)/)[1];

      root.memory.total = parseInt(total, 10) || 1;
      root.memory.used = (root.memory.total - parseInt(used, 10)) || 0;

      Functions.setDetails(root.memory.details, root.memory.used, root.memory.total);
    }
  }

  Process {
    id: storage

    running: true

    command: ["sh", "-c", "df | grep '^/dev/' | awk '{print $3, $4}'"]

    stdout: SplitParser {
      splitMarker: ""

      onRead: data => {
        const lines = data.trim().split("\n");
        let used = 0;
        let free = 0;

        for (const line of lines) {
          const [u, a] = line.split(" ");

          used += parseInt(u, 10);
          free += parseInt(a, 10);
        }

        root.storage.used = used;
        root.storage.total = used + free;

        Functions.setDetails(root.storage.details, root.storage.used, root.storage.total);
      }
    }
  }

  Process {
    id: swap

    running: true

    command: ["sh", "-c", "swapon --show --raw --noheadings --bytes"]

    stdout: SplitParser {
      splitMarker: ""

      onRead: data => {
        const values = data.trim().split(" ");

        root.swap.total = parseInt(values[2], 10);
        root.swap.used = parseInt(values[3], 10);

        Functions.setDetails(root.swap.details, root.swap.used, root.swap.total, 1);
      }
    }
  }
}
