import QtQuick.Layouts
import qs.config

ColumnLayout {
  spacing: Values.spacing.gap.largest

  Overview {
    Layout.alignment: Qt.AlignCenter
  }

  Launcher {
    Layout.alignment: Qt.AlignCenter
  }
}
