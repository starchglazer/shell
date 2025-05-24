import QtQuick
import QtQuick.Layouts
import "root:/components"
import "root:/config"

RowLayout {
  id: root

  property bool leftToRight: true
  property bool moreDetails: true

  property int size: 32

  required property string name
  required property real percent
  required property var details

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
      spacing: Values.spacing.gap.small

      Layout.alignment: root.leftToRight ? Qt.AlignRight : Qt.AlignLeft
      layoutDirection: root.leftToRight ? Qt.LeftToRight : Qt.RightToLeft

      RowLayout {
        spacing: Values.spacing.gap.none

        visible: moreDetails

        Layout.alignment: root.leftToRight ? Qt.AlignRight : Qt.AlignLeft

        StyledText {
          text: "("
          font.pointSize: Values.font.size.smaller
          font.weight: Values.font.weight.smallest
          font.family: Values.font.family.mono
        }

        StyledText {
          text: root.details?.used?.text ?? ""
          font.pointSize: Values.font.size.smaller
          font.weight: Values.font.weight.smallest
          font.family: Values.font.family.mono
        }

        StyledText {
          text: root.details?.used?.unit ?? ""
          font.pointSize: Values.font.size.tiny
          font.weight: Values.font.weight.smaller
        }

        StyledText {
          text: "/"
          font.pointSize: Values.font.size.smaller
          font.weight: Values.font.weight.smallest
          font.family: Values.font.family.mono
        }

        StyledText {
          text: root.details?.total?.text ?? ""
          font.pointSize: Values.font.size.smaller
          font.weight: Values.font.weight.smallest
          font.family: Values.font.family.mono
        }

        StyledText {
          text: root.details?.total?.unit ?? ""
          font.pointSize: Values.font.size.tiny
          font.weight: Values.font.weight.smaller
        }

        StyledText {
          text: ")"
          font.pointSize: Values.font.size.smaller
          font.weight: Values.font.weight.smallest
          font.family: Values.font.family.mono
        }
      }

      StyledText {
        visible: !moreDetails
        Layout.alignment: root.leftToRight ? Qt.AlignRight : Qt.AlignLeft

        text: root?.details ?? ""
        font.pointSize: Values.font.size.smaller
        font.weight: Values.font.weight.smallest
        font.family: Values.font.family.mono
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
