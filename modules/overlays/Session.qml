import QtQuick
import Quickshell
import Quickshell.Wayland
import "session"
import "root:/components"
import "root:/config"

Variants {
  model: Quickshell.screens

  StyledWindow {
    required property ShellScreen modelData

    visible: Shell.states.visibilities.session

    reloadableId: "Session"
    name: "Session"
    screen: modelData
    keyboardFocus: WlrKeyboardFocus.Exclusive
    layer: WlrLayer.Overlay
    color: Colors.black.bare

    anchors {
      top: true
      right: true
      bottom: true
      left: true
    }

    Content {
      anchors.centerIn: parent
    }
  }
}
