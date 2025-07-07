pragma Singleton

import Quickshell
import QtQuick

Singleton {
  component White: QtObject {
    readonly property color pure: "#ffffffff"
    readonly property color light: "#bfffffff"
    readonly property color medium: "#80ffffff"
    readonly property color dark: "#40ffffff"
    readonly property color bare: "#05ffffff"
  }

  component Black: QtObject {
    readonly property color pure: "#ff000000"
    readonly property color dark: "#bf000000"
    readonly property color medium: "#80000000"
    readonly property color light: "#40000000"
    readonly property color bare: "#05000000"
  }

  readonly property White white: White {}
  readonly property Black black: Black {}
  readonly property color none: "transparent"
}
