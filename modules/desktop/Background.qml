import Quickshell
import Quickshell.Wayland
import "widgets"
import "root:/config"

Variants {
  model: Quickshell.screens

  WlrLayershell {
    required property ShellScreen modelData

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
