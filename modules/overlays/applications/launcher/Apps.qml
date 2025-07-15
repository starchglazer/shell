import QtQuick
import QtQuick.Layouts
import Quickshell
import "root:/config"

GridLayout {
  required property list<DesktopEntry> entries

  width: 480
  height: 272

  rows: Shell.config.applications.grid.rows
  columns: Shell.config.applications.grid.columns
  rowSpacing: Values.spacing.margin.small
  columnSpacing: Values.spacing.margin.small
  uniformCellWidths: true
  uniformCellHeights: true

  Repeater {
    model: 6

    App {
      required property int index
      isActive: Shell.states.focused.applications === index
    }
  }
}
