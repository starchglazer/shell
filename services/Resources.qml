pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property int lastCpuIdle
  property int lastCpuTotal
  property real cpuPerc
  property real cpuSum
  property int cpuLen
  readonly property real cpuTemp: cpuSum > 0 ? (cpuSum / cpuLen) / 1000 : 0

  property int memUsed
  property int memTotal
  property string memDetails
  readonly property real memPerc: memTotal > 0 ? memUsed / memTotal : 0

  property int storageUsed
  property int storageTotal
  property string storageDetails
  readonly property real storagePerc: storageTotal > 0 ? storageUsed / storageTotal : 0

  property int swapUsed
  property int swapTotal
  property string swapDetails
  readonly property real swapPerc: swapTotal > 0 ? swapUsed / swapTotal : 0

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
      stat.reload();
      temp.running = true;
      meminfo.reload();
      storage.running = true;
      swap.running = true;
    }
  }

  FileView {
    id: stat

    path: "/proc/stat"

    onLoaded: {
      const data = text().match(/^cpu\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/);

      if (data) {
        const stats = data.slice(1).map(n => parseInt(n, 10));
        const total = stats.reduce((a, b) => a + b, 0);
        const idle = stats[3];

        const totalDiff = total - root.lastCpuTotal;
        const idleDiff = idle - root.lastCpuIdle;
        root.cpuPerc = totalDiff > 0 ? (1 - idleDiff / totalDiff) : 0;

        root.lastCpuTotal = total;
        root.lastCpuIdle = idle;
      }
    }
  }

  Process {
    id: temp

    running: true

    command: ["sh", "-c", "cat /sys/class/thermal/thermal_zone*/temp"]

    stdout: SplitParser {
      splitMarker: ""

      onRead: data => {
        const lines = data.trim().split("\n");
        let sum = 0, {length: len} = lines;

        for (const line of lines)
          sum += parseInt(line);

        root.cpuSum = sum;
        root.cpuLen = len;
      }
    }
  }

  FileView {
    id: meminfo

    path: "/proc/meminfo"

    onLoaded: {
      const data = text();
      root.memTotal = parseInt(data.match(/MemTotal: *(\d+)/)[1], 10) || 1;
      root.memUsed = (root.memTotal - parseInt(data.match(/MemAvailable: *(\d+)/)[1], 10)) || 0;
      root.memDetails = `${formatBytes(root.memUsed * 1024)} / ${formatBytes(root.memTotal * 1024)}`;
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
        let used = 0, avail = 0;

        for (const line of lines) {
          const [u, a] = line.split(" ");
          used += parseInt(u, 10);
          avail += parseInt(a, 10);
        }

        root.storageUsed = used;
        root.storageTotal = used + avail;
        root.storageDetails = `${formatBytes(root.storageUsed * 1024)} / ${formatBytes(root.storageTotal * 1024)}`;
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

        root.swapTotal = parseInt(values[2], 10);
        root.swapUsed = parseInt(values[3], 10);
        root.swapDetails = `${formatBytes(root.swapUsed)} / ${formatBytes(root.swapTotal)}`;
      }
    }
  }
}
