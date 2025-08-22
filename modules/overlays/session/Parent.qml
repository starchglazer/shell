import QtQuick
import QtQuick.Layouts
import qs.config

ColumnLayout {
  id: root

  property var entries: Shell.config.session.entries
  property int focused: Shell.states.focused.session

  spacing: Values.spacing.margin.large

  Sessions {
    entries: root.entries
    focused: root.focused
  }

  Label {
    Layout.alignment: Qt.AlignCenter
    label: entries[focused].label
  }
}
