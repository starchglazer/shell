import QtQuick
import Quickshell
import Quickshell.Wayland
import "datetime"
import "root:/components"
import "root:/config"

Variants {
  model: Quickshell.screens

  StyledWindow {
    required property ShellScreen modelData

    name: "DateTime"
    layer: WlrLayer.Bottom
    screen: modelData

    exclusionMode: ExclusionMode.Ignore
    keyboardFocus: WlrKeyboardFocus.None

    anchors {
      top: false
      right: false
      bottom: true
      left: true
    }
    margins {
      top: Values.spacing.margin.none
      right: Values.spacing.margin.none
      bottom: Values.spacing.margin.larger
      left: Values.spacing.margin.larger
    }

    implicitHeight: parent.implicitHeight
    implicitWidth: parent.implicitWidth

    Parent {
      id: parent
    }
  }
}
