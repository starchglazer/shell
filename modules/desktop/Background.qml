import Quickshell
import Quickshell.Wayland
import "background"
import "root:/components"
import "root:/config"

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
