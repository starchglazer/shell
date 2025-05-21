import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import "root:/components"
import "root:/config"
import "root:/services"

Variants {
  model: Quickshell.screens

  StyledWindow {
    required property ShellScreen modelData

    name: "Resources"
    layer: WlrLayer.Bottom
    screen: modelData
    color: "transparent"

    anchors {
      top: false
      right: false
      bottom: true
      left: false
    }
    margins {
      top: Values.spacing.margin.none
      right: Values.spacing.margin.none
      bottom: Values.spacing.margin.larger
      left: Values.spacing.margin.none
    }

    implicitHeight: container.implicitHeight
    implicitWidth: container.implicitWidth

    WrapperRectangle {
      id: container

      color: "#05000000"

      margin: Values.spacing.padding.largest

      implicitHeight: columns.implicitHeight
      implicitWidth: columns.implicitWidth

      radius: Values.rounding.large

      ColumnLayout {
        id: columns

        spacing: Values.spacing.gap.large
        uniformCellSizes: true

        Column {
          RowLayout {
            spacing: Values.spacing.gap.large
            uniformCellSizes: true

          }
        }

        Column {
          RowLayout {
            spacing: Values.spacing.gap.large
            uniformCellSizes: true

          }
        }
      }
    }
  }
}
