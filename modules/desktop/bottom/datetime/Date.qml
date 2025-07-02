import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "root:/components"
import "root:/config"
import "root:/services"

Column {
  RowLayout {
    spacing: Values.spacing.gap.small

    StyledText {
      text: DateTime.format(Shell.config.datetime.date.format.join(" "))
      font.pointSize: Values.font.size.medium
      font.weight: Values.font.weight.smaller
    }

    ToolSeparator {
      visible: Shell.config.datetime.date.hasFullDay
      orientation: Qt.Vertical
      Layout.fillHeight: true
    }

    StyledText {
      visible: Shell.config.datetime.date.hasFullDay
      text: DateTime.format("dddd")
      font.pointSize: Values.font.size.smaller
      font.weight: Values.font.weight.smaller
    }
  }
}
