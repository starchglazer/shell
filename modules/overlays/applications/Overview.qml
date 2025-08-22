import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.config

RowLayout {
  id: root

  spacing: Values.spacing.gap.large

  uniformCellSizes: true

  Workspace {
    border.width: 2
    border.color: Colors.white.light
  }
  Workspace {}
  Workspace {}
  Workspace {}

  component Workspace: ClippingWrapperRectangle {
    implicitWidth: 228
    implicitHeight: 128
    border.width: 1
    border.color: Colors.white.dark
    radius: Values.rounding.large
    Wallpaper {}
  }

  component Wallpaper: Image {
    cache: true
    asynchronous: true
    retainWhileLoading: true
    anchors.fill: parent
    fillMode: Image.PreserveAspectCrop
    source: Shell.states.wallpaper
  }
}
