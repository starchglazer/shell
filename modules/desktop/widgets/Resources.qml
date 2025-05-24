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
          percent: Resources.cpu.percent
          details: `(${Math.ceil(Resources.cpu.temperature)}°C)`
        }

        ResourceCircularProgress {
          name: "Memory"
          percent: Resources.memory.percent
          details: `(${Resources.memory.details.text})`
          leftToRight: false
        }

        ResourceCircularProgress {
          name: "Storage"
          percent: Resources.storage.percent
          details: `(${Resources.storage.details.text})`
        }

        ResourceCircularProgress {
          name: "Swap"
          percent: Resources.swap.percent
          details: `(${Resources.swap.details.text})`
          leftToRight: false
        }
      }
    }
  }
}
