import Quickshell
import Quickshell.Wayland
import qs.components
import qs.config
import "./background"

Variants {
  model: Quickshell.screens

  StyledWindow {
    required property ShellScreen modelData

    name: "Background"
    screen: modelData
    layer: WlrLayer.Background
    color: Colors.black.pure

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
