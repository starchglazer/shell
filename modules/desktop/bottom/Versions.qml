import QtQuick
import Quickshell
import Quickshell.Wayland
import "versions"
import "root:/components"
import "root:/config"

Variants {
  model: Quickshell.screens

  StyledWindow {
    required property ShellScreen modelData

    name: "Versions"
    layer: WlrLayer.Bottom
    screen: modelData

    exclusionMode: ExclusionMode.Ignore
    keyboardFocus: WlrKeyboardFocus.None

    anchors {
      top: false
      right: true
      bottom: true
      left: false
    }
    margins {
      top: Values.spacing.margin.none
      right: Values.spacing.margin.larger
      bottom: Values.spacing.margin.larger
      left: Values.spacing.margin.none
    }

    implicitHeight: parent.implicitHeight
    implicitWidth: parent.implicitWidth

    Parent {
      id: parent
    }
  }
}
