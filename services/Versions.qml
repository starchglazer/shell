pragma Singleton

import QtQuick
import Quickshell

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
}
