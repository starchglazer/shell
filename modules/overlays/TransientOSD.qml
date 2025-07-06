import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import "transientOsd"
import "root:/components"
import "root:/config"

Variants {
  model: Quickshell.screens

  StyledWindow {
    id: root

    required property ShellScreen modelData
    property QtObject visibilities: Shell.states.visibilities

    visible: !!visibilities.transientOSD

    name: "TransientOSD"
    layer: WlrLayer.Overlay
    screen: modelData

    exclusionMode: ExclusionMode.Ignore
    keyboardFocus: WlrKeyboardFocus.None

    anchors {
      top: true
      right: false
      bottom: false
      left: false
    }
    margins {
      top: Values.spacing.margin.small
      right: Values.spacing.margin.none
      bottom: Values.spacing.margin.none
      left: Values.spacing.margin.none
    }

    implicitHeight: parent.implicitHeight
    implicitWidth: parent.implicitWidth

    WrapperRectangle {
      id: parent

      margin: Values.spacing.padding.larger

      color: Colors.black.light
      radius: Values.rounding.large
      border.width: 2
      border.color: Colors.white.light

      Loader {
        active: !!visibilities.transientOSD;
        source: Qt.resolvedUrl(`./transientOsd/${!!visibilities.transientOSD ? visibilities.transientOSD : visibilities.lastTransientOSD}.qml`)
      }
    }
  }
}
