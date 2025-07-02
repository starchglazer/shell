import QtQuick
import QtQuick.Layouts
import "root:/config"

ColumnLayout {
  id: root

  spacing: Values.spacing.gap.large

  Overview {}
  Launcher {}
}
