import QtQuick
import QtQuick.Layouts
import "root:/components"
import "root:/config"
import "root:/services"

Column {
  RowLayout {
    spacing: Shell.facets.datetime.spacing.time

    StyledText {
      text: DateTime.format(Shell.config.datetime.time.hour)
      font.pointSize: Shell.facets.datetime.size.time
      font.weight: Shell.facets.datetime.weight.time
    }

    StyledText {
      text: ":"
      font.pointSize: Shell.facets.datetime.size.time
      font.weight: Shell.facets.datetime.weight.separator
    }

    StyledText {
      text: DateTime.format(Shell.config.datetime.time.minute)
      font.pointSize: Shell.facets.datetime.size.time
      font.weight: Shell.facets.datetime.weight.time
    }

    StyledText {
      visible: Shell.config.datetime.time.second.length > 0
      text: ":"
      font.pointSize: Shell.facets.datetime.size.time
      font.weight: Shell.facets.datetime.weight.separator
    }

    StyledText {
      visible: Shell.config.datetime.time.second.length > 0
      text: DateTime.format(Shell.config.datetime.time.second)
      font.pointSize: Shell.facets.datetime.size.time
      font.weight: Shell.facets.datetime.weight.time
    }
  }
}
