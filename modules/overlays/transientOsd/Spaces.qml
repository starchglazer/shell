import QtQuick
import QtQuick.Layouts
import Quickshell
import "root:/config"
import "root:/services"

RowLayout {
  id: root

  property int fixedWorkspaces: Shell.config.hyprland.fixedWorkspaces

  spacing: Values.spacing.gap.largest
  uniformCellSizes: true

  Repeater {
    model: root.fixedWorkspaces

    Rectangle {
      Layout.minimumHeight: 8 + Values.spacing.padding.smallest
      Layout.minimumWidth: 8 + Values.spacing.padding.smallest

      required property int index
      property bool isActive: (index + 1) % root.fixedWorkspaces === Hyprland.activeWorkspace % root.fixedWorkspaces

      color: Colors.none

      Rectangle {
        id: workspace

        anchors.centerIn: parent

        implicitWidth: isActive ? 8 : 4
        implicitHeight: isActive ? 8 : 4

        color: isActive ? Colors.white.pure : Colors.white.dark
        radius: Values.rounding.large
        border.width: isActive ? 0 : 2
        border.color: isActive ? Colors.white.light : Colors.white.medium
      }
    }
  }
}
