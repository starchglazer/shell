import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import qs.components
import qs.config
import "./session"
import "root:/functions/session.js" as Functions

Variants {
  model: Quickshell.screens

  StyledWindow {
    id: root

    required property ShellScreen modelData

    visible: Shell.states.visibilities.session

    reloadableId: "Session"
    name: "Session"

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
      focus: true
      anchors.fill: parent
      onClicked: Functions.clear()
      Keys.onPressed: (event) => Functions.onPressed(event.key);

      Parent {
        anchors.centerIn: parent
      }
    }
  }
}
