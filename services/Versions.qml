pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  component Details: QtObject {
    property string version
    property string commit
  }

  property QtObject os: QtObject {
    property string name
    property Details details: Details {
      property string generation
    }
  }

  property QtObject wm: QtObject {
    property string name
    property Details details: Details {}
  }

  Timer {
    running: true
    interval: 10000
    repeat: true
    onTriggered: {
      os.reload();
      gen.running = true;
      wm.running = true;
      hl.running = true;
    }
  }

  FileView {
    id: os

    path: "/etc/os-release"

    onLoaded: {
      const data = text().trim().split("\n");

      const name = data.find((str) => str.match(/^NAME=/)).split("=")[1];
      const version = data.find((str) => str.match(/^VERSION_ID=/)).split("=")[1].slice(1, -1);;
      const commit = data.find((str) => str.match(/^BUILD_ID=/)).split("=")[1].split(".")[3].replace('"', "").toUpperCase();

      root.os.name = name;
      root.os.details.version = version;
      root.os.details.commit = commit;
    }
  }

  Process {
    id: gen

    running: true

    command: ["sh", "-c", "nixos-rebuild list-generations"]

    stdout: SplitParser {
      splitMarker: ""

      onRead: data =>{
        const line = data.trim().split("\n").find((str) => str.match(/current/));
        const current = line.split(" ")[0];

        root.os.details.generation = current;
      }
    }
  }

  Process {
    id: wm

    running: true

    command: ["sh", "-c", "echo $XDG_CURRENT_DESKTOP"]

    stdout: SplitParser {
      splitMarker: ""

      onRead: data =>
        root.wm.name = data.trim();
    }
  }

  Process {
    id: hl

    running: true

    command: ["sh", "-c", "hyprctl version"]

    stdout: SplitParser {
      splitMarker: ""

      onRead: data => {
        const line = data.trim().split("\n").find((str) => str.match(/^Tag:/)).split(",");

        const version = line[0].split(" ")[1];
        const commit = line[1].split(" ")[2].slice(0, 7).toUpperCase();

        root.wm.details.version = version;
        root.wm.details.commit = commit;
      }
    }
  }
}
