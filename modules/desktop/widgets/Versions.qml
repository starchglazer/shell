import QtQuick
import QtQuick.Controls
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

    name: "Versions"
    layer: WlrLayer.Bottom
    screen: modelData

    anchors {
      top: false
      right: true
      bottom: true
      left: false
    }
    margins {
      top: Values.spacing.margin.none
      right: Values.spacing.margin.larger
      bottom: Values.spacing.margin.larger
      left: Values.spacing.margin.none
    }

    implicitHeight: container.implicitHeight
    implicitWidth: container.implicitWidth

    WrapperRectangle {
      id: container

      color: "#a5000000"

      margin: Values.spacing.padding.largest

      radius: Values.rounding.large

      implicitHeight: rows.implicitHeight
      implicitWidth: rows.implicitWidth

      RowLayout {
        id: rows
        spacing: Values.spacing.gap.medium

        Row {

        }

        ToolSeparator {
          orientation: Qt.Vertical
          Layout.fillHeight: true
        }

        Row {

        }
      }
    }
  }
}
