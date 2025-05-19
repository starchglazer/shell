import Quickshell
import Quickshell.Wayland
import "root:/config"
import "widgets"

Variants {
  model: Quickshell.screens

  WlrLayershell {
    required property ShellScreen modelData

    namespace: "mist-shell-desktop"

    screen: modelData
    color: "transparent"

    layer: WlrLayer.Bottom
    exclusionMode: ExclusionMode.Ignore
    keyboardFocus: WlrKeyboardFocus.None

    anchors {
      top: false
      right: true
      bottom: true
      left: true
    }
    margins {
      top: Values.spacing.margin.none
      right: Values.spacing.margin.large
      bottom: Values.spacing.margin.large
      left: Values.spacing.margin.large
    }

    DateTime {}
  }
}
