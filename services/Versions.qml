pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  component Details: QtObject {
    property string version
    property string revision
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
    interval: 1000
    repeat: true
    onTriggered: {
      osRelease.reload();
    }
  }

  FileView {
    id: osRelease

    path: "/etc/os-release"

    onLoaded: {

    }
  }
}
