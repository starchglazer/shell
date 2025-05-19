import Quickshell
import Quickshell.Wayland
import "widgets"

Variants {
  model: Quickshell.screens

  WlrLayershell {
    required property ShellScreen modelData

    screen: modelData
    color: "black"

    layer: WlrLayer.Background
    exclusionMode: ExclusionMode.Ignore
    keyboardFocus: WlrKeyboardFocus.None
    anchors {
      top: true
      right: true
      bottom: true
      left: true
    }

    Wallpaper {}
  }
}
