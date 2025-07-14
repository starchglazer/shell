import QtQuick
import QtQuick.Layouts
import "root:/config"
import "launcher"

ColumnLayout {
  id: root

  spacing: Values.spacing.gap.largest

  Input {
    Layout.alignment: Qt.AlignCenter
  }

  Applications {
    Layout.alignment: Qt.AlignCenter
  }

  Label {
    Layout.alignment: Qt.AlignCenter
  }
}
