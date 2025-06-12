import QtQuick
import QtQuick.Layouts
import "root:/components"
import "root:/config"
import "root:/services"

ColumnLayout {
  Layout.minimumWidth: 1
  Layout.alignment: Qt.AlignRight
  Layout.fillWidth: true
  spacing: Values.spacing.gap.small

  StyledText {
    Layout.alignment: Qt.AlignRight
    text: Versions.wm.name
    font.weight: Values.font.weight.medium
  }

  RowLayout {
    Layout.minimumWidth: 1
    Layout.alignment: Qt.AlignRight
    spacing: Values.spacing.gap.small

    StyledText {
      Layout.alignment: Qt.AlignRight
      text: `on ${Versions.wm.details.version}`
      font.weight: Values.font.weight.small
    }

    StyledText {
      Layout.alignment: Qt.AlignRight
      text: `(${Versions.wm.details.commit})`
      font.pointSize: Values.font.size.smallest
      font.family: Values.font.family.mono
    }
  }
}
