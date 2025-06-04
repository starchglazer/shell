import QtQuick
import Quickshell
import Quickshell.Wayland
import "applications"
import "root:/components"
import "root:/config"

Variants {
  model: Quickshell.screens

  StyledWindow {
    id: root

    required property ShellScreen modelData

    visible: Shell.states.visibilities.applications

    reloadableId: "Applications"
    name: "Applications"

    screen: modelData
    exclusionMode: ExclusionMode.Ignore
    keyboardFocus: WlrKeyboardFocus.Exclusive
    layer: WlrLayer.Overlay
    color: Colors.black.bare

    anchors {
      top: true
      right: true
      bottom: true
      left: true
    }

    MouseArea {
      anchors.fill: parent
      onClicked: Shell.states.visibilities.applications = false;
    }

    Parent {}
  }
}
