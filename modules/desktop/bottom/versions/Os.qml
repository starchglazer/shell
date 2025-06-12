import QtQuick
import QtQuick.Layouts
import "root:/components"
import "root:/config"
import "root:/services"

ColumnLayout {
  Layout.minimumWidth: 1
  Layout.fillWidth: true
  spacing: Values.spacing.gap.small

  RowLayout {
    Layout.minimumWidth: 1
    Layout.fillWidth: true
    spacing: Values.spacing.gap.small

    StyledText {
      text: Versions.os.name
      font.weight: Values.font.weight.medium
    }

    StyledText {
      visible: Versions.os.details?.generation ? true : false
      text: `Gen. #${Versions.os.details?.generation ?? ""}`
      font.pointSize: Values.font.size.smallest
    }
  }

  RowLayout {
    Layout.minimumWidth: 1
    Layout.fillWidth: true
    spacing: Values.spacing.gap.small

    StyledText {
      text: `on ${Versions.os.details.version}`
      font.weight: Values.font.weight.small
    }

    StyledText {
      text: `(${Versions.os.details.commit})`
      font.pointSize: Values.font.size.smallest
      font.family: Values.font.family.mono
    }
  }
}
