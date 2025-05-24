pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property QtObject cpu: QtObject {
    property int idle
    property int total
    property real percent

    property string details

    property int cores
    property int summation
    readonly property real temperature: summation > 0 ? (summation / cores) / 1000 : 0
  }

  property QtObject memory: QtObject {
    property int used
    property int total
    readonly property real percent: total > 0 ? used / total : 0

    property QtObject details: QtObject {
      property string text
      // property string unit
    }
  }

  property QtObject storage: QtObject {
    property int used
    property int total
    readonly property real percent: total > 0 ? used / total : 0

    property QtObject details: QtObject {
      property string text
      // property string unit
    }
  }

  property QtObject swap: QtObject {
    property int used
    property int total
    readonly property real percent: total > 0 ? used / total : 0

    property QtObject details: QtObject {
      property string text
      // property string unit
    }
  }


  function formatBytes(bytes): string {
    const GiB = 1073741824, MiB = 1048576, KiB = 1024;

    if (bytes >= GiB) return (bytes / GiB).toFixed(0) + "GiB";
    else if (bytes >= MiB) return (bytes / MiB).toFixed(0) + "MiB";
    else return (bytes / KiB).toFixed(0) + "KiB";
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
      const data = text().match(/^cpu\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/);

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
        let sum = 0, {length: len} = lines;

        for (const line of lines)
          sum += parseInt(line);

        root.cpu.summation = sum;
        root.cpu.cores = len;
      }
    }
  }

  FileView {
    id: memInfo

    path: "/proc/meminfo"

    onLoaded: {
      const data = text();
      root.memory.total = parseInt(data.match(/MemTotal: *(\d+)/)[1], 10) || 1;
      root.memory.used = (root.memory.total - parseInt(data.match(/MemAvailable: *(\d+)/)[1], 10)) || 0;
      root.memory.details.text = `${formatBytes(root.memory.used * 1024)} / ${formatBytes(root.memory.total * 1024)}`;
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
        let used = 0, free = 0;

        for (const line of lines) {
          const [u, a] = line.split(" ");
          used += parseInt(u, 10);
          free += parseInt(a, 10);
        }

        root.storage.used = used;
        root.storage.total = used + free;
        root.storage.details.text = `${formatBytes(root.storage.used * 1024)} / ${formatBytes(root.storage.total * 1024)}`;
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
        root.swap.details.text = `${formatBytes(root.swap.used)} / ${formatBytes(root.swap.total)}`;
      }
    }
  }
}
