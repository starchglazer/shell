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

      color: Colors.black.bare
      margin: Values.spacing.padding.largest
      radius: Values.rounding.large

      GridLayout {
        rows: 2
        columns: 2

        rowSpacing: Values.spacing.gap.medium
        columnSpacing: Values.spacing.gap.medium

        uniformCellWidths: true
        uniformCellHeights: true

        ResourceCircularProgress {
          name: "CPU"
          percent: Resources.cpu.percent
          details: Resources.cpu.details
          moreDetails: false
        }

        ResourceCircularProgress {
          name: "Memory"
          percent: Resources.memory.percent
          details: Resources.memory.details
          leftToRight: false
        }

        ResourceCircularProgress {
          name: "Storage"
          percent: Resources.storage.percent
          details: Resources.storage.details
        }

        ResourceCircularProgress {
          name: "Swap"
          percent: Resources.swap.percent
          details: Resources.swap.details
          leftToRight: false
        }
      }
    }
  }
}
