import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.components
import qs.config
import "./versions"

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
