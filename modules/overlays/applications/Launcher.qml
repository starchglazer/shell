import QtQuick
import QtQuick.Layouts
import Quickshell
import "root:/config"
import "root:/services"
import "root:/utils/applications.js" as Functions
import "launcher"

ColumnLayout {
  id: root

  property bool active: !!Shell.states.focused.application
  property string text: root.active ? Shell.states.focused.application : "Search apps"
  property list<DesktopEntry> entries: root.active ? Functions.getEntries() : null
  property int index: Shell.states.focused.applications

  focus: Shell.states.visibilities.applications
  Keys.onPressed: (event) => Functions.onPressed(event)

  spacing: Values.spacing.gap.largest

  Input {
    Layout.alignment: Qt.AlignCenter
    text: root.text
  }

  Apps {
    Layout.alignment: Qt.AlignCenter
    entries: root.entries
  }

  Label {
    Layout.alignment: Qt.AlignCenter
    label: root.entries[index]?.name ?? ""
  }
}
