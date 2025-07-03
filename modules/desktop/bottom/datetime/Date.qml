import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "root:/components"
import "root:/config"
import "root:/services"

Column {
  RowLayout {
    spacing: Shell.facets.datetime.spacing.date

    StyledText {
      text: DateTime.format(Shell.config.datetime.date.format.join(" "))
      font.pointSize: Shell.facets.datetime.size.date
      font.weight: Shell.facets.datetime.weight.date
    }

    ToolSeparator {
      visible: Shell.config.datetime.date.hasFullDay
      orientation: Qt.Vertical
      Layout.fillHeight: true
    }

    StyledText {
      visible: Shell.config.datetime.date.hasFullDay
      text: DateTime.format("dddd")
      font.pointSize: Shell.facets.datetime.size.fullDay
      font.weight: Shell.facets.datetime.weight.date
    }
  }
}
