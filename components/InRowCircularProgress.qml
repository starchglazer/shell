import QtQuick
import QtQuick.Layouts
import "root:/components"
import "root:/config"

RowLayout {
  id: root

  property int size: 32

  required property real percent
  required property string name
  required property string value
  required property string details
  property bool first: false

  spacing: Values.spacing.gap.large
  layoutDirection: root.first ? Qt.LeftToRight : Qt.RightToLeft

  ColumnLayout {
    spacing: Values.spacing.gap.none

    StyledText {
      text: root.name
      font.pointSize: Values.font.size.tiny
      font.weight: Values.font.weight.small
    }

    Row {
      StyledText {
        text: root.details
        font.pointSize: Values.font.size.smaller
        font.weight: Values.font.weight.small
      }

      StyledText {
        text: root.value
        font.pointSize: Values.font.size.smaller
        font.weight: Values.font.weight.medium
      }
    }
  }

  CircularProgress {
    size: root.size
    value: root.percent
  }
}
