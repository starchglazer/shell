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

      color: "#05000000"

      margin: Values.spacing.padding.largest

      radius: Values.rounding.large

      implicitHeight: rows.implicitHeight
      implicitWidth: rows.implicitWidth

      RowLayout {
        id: rows
        spacing: Values.spacing.gap.larger

        ColumnLayout {
          Layout.fillWidth: true
          spacing: Values.spacing.gap.small

          RowLayout {
            spacing: Values.spacing.gap.small

            StyledText {
              text: Versions.os.name
              font.weight: Values.font.weight.medium
            }

            StyledText {
              visible: Versions.os.details?.generation ? true : false
              text: `Gen. #${Versions.os.details?.generation ?? ""}`
              font.pointSize: Values.font.size.smallest
              font.weight: Values.font.weight.small
            }
          }

          RowLayout {
            spacing: Values.spacing.gap.small

            StyledText {
              text: `on ${Versions.os.details.version}`
              font.weight: Values.font.weight.small
            }

            StyledText {
              text: `(${Versions.os.details.commit})`
              font.pointSize: Values.font.size.smallest
              font.family: Values.font.family.mono
            }
          }
        }

        ToolSeparator {
          orientation: Qt.Vertical
          Layout.fillHeight: true
        }

        ColumnLayout {
          Layout.fillWidth: true
          spacing: Values.spacing.gap.small

          Layout.alignment: Qt.AlignRight

          StyledText {
            Layout.alignment: Qt.AlignRight
            text: Versions.wm.name
            font.weight: Values.font.weight.medium
          }


          RowLayout {
            spacing: Values.spacing.gap.small
            Layout.alignment: Qt.AlignRight

            StyledText {
              Layout.alignment: Qt.AlignRight
              text: `on ${Versions.wm.details.version}`
              font.weight: Values.font.weight.small
            }

            StyledText {
              Layout.alignment: Qt.AlignRight
              text: `(${Versions.wm.details.commit})`
              font.pointSize: Values.font.size.smallest
              font.family: Values.font.family.mono
            }
          }
        }
      }
    }
  }
}
