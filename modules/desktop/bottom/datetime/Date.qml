import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config
import qs.services

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
