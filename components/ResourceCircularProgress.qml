import QtQuick
import QtQuick.Layouts
import "root:/components"
import "root:/config"

RowLayout {
  id: root

  property bool leftToRight: true

  property int size: 32

  required property string name
  required property real percent
  required property string details

  Layout.fillWidth: true
  Layout.alignment: root.leftToRight ? Qt.AlignRight : Qt.AlignLeft
  layoutDirection: root.leftToRight ? Qt.LeftToRight : Qt.RightToLeft

  spacing: Values.spacing.gap.large

  ColumnLayout {
    spacing: Values.spacing.gap.none

    StyledText {
      Layout.alignment: root.leftToRight ? Qt.AlignRight : Qt.AlignLeft

      text: root.name
      font.pointSize: Values.font.size.tiny
      font.weight: Values.font.weight.small
    }

    Row {
      Layout.alignment: root.leftToRight ? Qt.AlignRight : Qt.AlignLeft
      layoutDirection: root.leftToRight ? Qt.LeftToRight : Qt.RightToLeft

      StyledText {
        Layout.alignment: root.leftToRight ? Qt.AlignRight : Qt.AlignLeft

        text: root.details
        font.pointSize: Values.font.size.smaller
        font.weight: Values.font.weight.small
      }

      StyledText {
        Layout.alignment: root.leftToRight ? Qt.AlignRight : Qt.AlignLeft

        text: `${Math.floor(root.percent * 100)}%`
        font.pointSize: Values.font.size.smaller
        font.weight: Values.font.weight.medium
        font.family: Values.font.family.mono
      }
    }
  }

  CircularProgress {
    size: root.size
    value: root.percent
  }
}
