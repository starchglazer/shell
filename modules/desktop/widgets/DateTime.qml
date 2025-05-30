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

    name: "DateTime"
    layer: WlrLayer.Bottom
    screen: modelData

    anchors {
      top: false
      right: false
      bottom: true
      left: true
    }
    margins {
      top: Values.spacing.margin.none
      right: Values.spacing.margin.none
      bottom: Values.spacing.margin.larger
      left: Values.spacing.margin.larger
    }

    implicitHeight: container.implicitHeight
    implicitWidth: container.implicitWidth

    WrapperRectangle {
      id: container

      color: Colors.black.bare
      margin: Values.spacing.padding.largest
      radius: Values.rounding.large

      ColumnLayout {
        spacing: Values.spacing.gap.small

        Column {
          RowLayout {
            spacing: Values.spacing.gap.none

            StyledText {
              text: DateTime.format("hh")
              font.pointSize: Values.font.size.larger
              font.weight: Values.font.weight.medium
            }

            StyledText {
              text: DateTime.format(":")
              font.pointSize: Values.font.size.larger
              font.weight: Values.font.weight.small
            }

            StyledText {
              text: DateTime.format("mm")
              font.pointSize: Values.font.size.larger
              font.weight: Values.font.weight.medium
            }

            StyledText {
              text: DateTime.format(":")
              font.pointSize: Values.font.size.larger
              font.weight: Values.font.weight.small
            }

            StyledText {
              text: DateTime.format("ss")
              font.pointSize: Values.font.size.larger
              font.weight: Values.font.weight.medium
            }
          }
        }

        Column {
          RowLayout {
            spacing: Values.spacing.gap.small

            StyledText {
              text: DateTime.format("yyyy MMMM dd")
              font.pointSize: Values.font.size.medium
              font.weight: Values.font.weight.smaller
            }

            ToolSeparator {
              orientation: Qt.Vertical
              Layout.fillHeight: true
            }

            StyledText {
              text: DateTime.format("dddd")
              font.pointSize: Values.font.size.smaller
              font.weight: Values.font.weight.smaller
            }
          }
        }
      }
    }
  }
}
