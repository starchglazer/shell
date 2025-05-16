import QtQuick
import Quickshell
import Quickshell.Wayland

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

    Image {
      cache: false
      asynchronous: true
      retainWhileLoading: true
      anchors.fill: parent
      fillMode: Image.PreserveAspectCrop
      source: "file:///home/inspiron/Pictures/walls/8.jpg"
    }
  }
}
