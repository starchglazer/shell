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

        spacing: Values.spacing.gap.medium
        uniformCellSizes: true

        Column {
          RowLayout {
            spacing: Values.spacing.gap.medium
            uniformCellSizes: true

            InRowCircularProgress {
              name: "CPU"
              percent: Resources.cpuPerc
              value: `${Math.floor(Resources.cpuPerc * 100)}%`
              details: ""
              first: true
            }

            InRowCircularProgress {
              name: "Memory"
              percent: Resources.memPerc
              value: `${Math.floor(Resources.memPerc * 100)}%`
              details: ""
            }
          }
        }

        Column {
          RowLayout {
            spacing: Values.spacing.gap.medium
            uniformCellSizes: true

            InRowCircularProgress {
              name: "Storage"
              percent: Resources.storagePerc
              value: `${Math.floor(Resources.storagePerc * 100)}%`
              details: ""
              first: true
            }

            InRowCircularProgress {
              name: "Swap"
              percent: 0
              value: "0%"
              details: ""
            }
          }
        }
      }
    }
  }
}
