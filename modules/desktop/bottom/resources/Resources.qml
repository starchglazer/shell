import QtQuick
import QtQuick.Layouts
import "root:/config"
import "root:/services"

GridLayout {
  rows: 2
  columns: 2

  rowSpacing: Values.spacing.gap.medium
  columnSpacing: Values.spacing.gap.medium

  uniformCellWidths: true
  uniformCellHeights: true

  Resource {
    name: "CPU"
    percent: Resources.cpu.percent
    details: Resources.cpu.details
    moreDetails: false
  }

  Resource {
    name: "Memory"
    percent: Resources.memory.percent
    details: Resources.memory.details
    leftToRight: false
  }

  Resource {
    name: "Storage"
    percent: Resources.storage.percent
    details: Resources.storage.details
  }

  Resource {
    name: "Swap"
    percent: Resources.swap.percent
    details: Resources.swap.details
    leftToRight: false
  }
}
