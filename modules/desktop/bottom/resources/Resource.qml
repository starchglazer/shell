import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config

RowLayout {
  id: root

  property bool leftToRight: true
  property bool moreDetails: true

  property int size: 32

  required property string name
  required property real percent
  required property QtObject details

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
    }

    Row {
      spacing: Values.spacing.gap.small

      Layout.alignment: root.leftToRight ? Qt.AlignRight : Qt.AlignLeft
      layoutDirection: root.leftToRight ? Qt.LeftToRight : Qt.RightToLeft

      RowLayout {
        Layout.alignment: root.leftToRight ? Qt.AlignRight : Qt.AlignLeft
        spacing: Values.spacing.gap.none
        visible: moreDetails

        StyledText {
          text: "("
          font.pointSize: Values.font.size.smaller
          font.weight: Values.font.weight.smallest
          font.family: Values.font.family.mono
        }

        StyledText {
          text: root.details?.used?.text ?? ""
          font.pointSize: Values.font.size.smaller
          font.weight: Values.font.weight.smaller
          font.family: Values.font.family.mono
        }

        StyledText {
          text: root.details?.used?.unit ?? ""
          font.pointSize: Values.font.size.tiny
          font.weight: Values.font.weight.small
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
          font.weight: Values.font.weight.smaller
          font.family: Values.font.family.mono
        }

        StyledText {
          text: root.details?.total?.unit ?? ""
          font.pointSize: Values.font.size.tiny
          font.weight: Values.font.weight.small
        }

        StyledText {
          text: ")"
          font.pointSize: Values.font.size.smaller
          font.weight: Values.font.weight.smallest
          font.family: Values.font.family.mono
        }
      }

      RowLayout {
        spacing: Values.spacing.gap.none
        visible: !moreDetails

        StyledText {
          text: "("
          font.pointSize: Values.font.size.smaller
          font.weight: Values.font.weight.smallest
          font.family: Values.font.family.mono
        }

        StyledText {
          text: root.details?.text ?? ""
          font.pointSize: Values.font.size.smaller
          font.weight: Values.font.weight.smaller
          font.family: Values.font.family.mono
        }

        StyledText {
          text: root.details?.unit ?? ""
          font.pointSize: Values.font.size.tiny
          font.weight: Values.font.weight.small
        }

        StyledText {
          text: ")"
          font.pointSize: Values.font.size.smaller
          font.weight: Values.font.weight.smallest
          font.family: Values.font.family.mono
        }
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
