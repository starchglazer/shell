import QtQuick
import QtQuick.Layouts
import "root:/config"

ColumnLayout {
  id: root

  property var entries: Shell.config.session.entries
  property int focused: Shell.states.focused.session

  spacing: Shell.facets.session.spacing.parent

  Buttons {
    entries: root.entries
    focused: root.focused
  }

  Label {
    Layout.alignment: Qt.AlignCenter
    label: entries[focused].label
  }
}
