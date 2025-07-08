import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import "root:/components"
import "root:/config"

GridLayout {
  id: root

  required property var entries
  required property int focused

  rows: Shell.config.session.grid.rows
  columns: Shell.config.session.grid.columns

  rowSpacing: Values.spacing.gap.large
  columnSpacing: Values.spacing.gap.large

  uniformCellWidths: true
  uniformCellHeights: true


  Repeater {
    model: root.entries

    Session {
      id: button

      required property var modelData
      required property int index

      icon: modelData.icon
      command: modelData.command
      focused: (index === root.focused)
      current: index
    }
  }
}
