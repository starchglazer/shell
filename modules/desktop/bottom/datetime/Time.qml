import QtQuick
import QtQuick.Layouts
import "root:/components"
import "root:/config"
import "root:/services"

Column {
  RowLayout {
    spacing: Values.spacing.gap.none

    StyledText {
      text: DateTime.format(Shell.config.datetime.time.hour)
      font.pointSize: Values.font.size.larger
      font.weight: Values.font.weight.medium
    }

    StyledText {
      text: ":"
      font.pointSize: Values.font.size.larger
      font.weight: Values.font.weight.small
    }

    StyledText {
      text: DateTime.format(Shell.config.datetime.time.minute)
      font.pointSize: Values.font.size.larger
      font.weight: Values.font.weight.medium
    }

    StyledText {
      visible: Shell.config.datetime.time.second.length > 0
      text: ":"
      font.pointSize: Values.font.size.larger
      font.weight: Values.font.weight.small
    }

    StyledText {
      visible: Shell.config.datetime.time.second.length > 0
      text: DateTime.format(Shell.config.datetime.time.second)
      font.pointSize: Values.font.size.larger
      font.weight: Values.font.weight.medium
    }
  }
}
