import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.components
import qs.config
import qs.services

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
