import QtQuick.Layouts
import "root:/config"

ColumnLayout {
  spacing: Values.spacing.gap.largest

  Overview {
    Layout.alignment: Qt.AlignCenter
  }

  Launcher {
    Layout.alignment: Qt.AlignCenter
  }
}
