import QtQuick
import Quickshell
import Quickshell.Wayland
import "root:/components"
import "root:/config"

Variants {
  model: Quickshell.screens

  StyledWindow {
    required property ShellScreen modelData

    name: "Resources"
    layer: WlrLayer.Bottom
    screen: modelData
    color: "transparent"

    anchors {
      top: false
      right: false
      bottom: true
      left: false
    }
    margins {
      top: Values.spacing.margin.none
      right: Values.spacing.margin.none
      bottom: Values.spacing.margin.larger
      left: Values.spacing.margin.none
    }


  }
}
