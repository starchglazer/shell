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

      implicitHeight: grid.implicitHeight
      implicitWidth: grid.implicitWidth

      radius: Values.rounding.large

      GridLayout {
        id: grid

        rows: 2
        columns: 2

        uniformCellWidths: true
        uniformCellHeights: true

        rowSpacing: Values.spacing.gap.medium
        columnSpacing: Values.spacing.gap.medium

        ResourceCircularProgress {
          name: "CPU"
          percent: Resources.cpuPerc
          details: `(${Math.ceil(Resources.cpuTemp)}°C)`
        }

        ResourceCircularProgress {
          name: "Memory"
          percent: Resources.memPerc
          details: `(${Resources.memDetails})`
          leftToRight: false
        }

        ResourceCircularProgress {
          name: "Storage"
          percent: Resources.storagePerc
          details: `(${Resources.storageDetails})`
        }

        ResourceCircularProgress {
          name: "Swap"
          percent: Resources.swapPerc
          details: `(${Resources.swapDetails})`
          leftToRight: false
        }
      }
    }
  }
}
