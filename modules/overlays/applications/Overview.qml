import QtQuick
import QtQuick.Layouts
import Quickshell
import "root:/config"
import "root:/services"
import "overview"

RowLayout {
  id: root

  property int fixedWorkspaces: Shell.config.hyprland.fixedWorkspaces

  spacing: Values.spacing.gap.large
  uniformCellSizes: true

  Repeater {
    model: root.fixedWorkspaces

    Item {
      Layout.minimumWidth: 228
      Layout.minimumHeight: 128

      required property int index
      property bool isActive: (index + 1) % root.fixedWorkspaces === Hyprland.activeWorkspace % root.fixedWorkspaces

      Workspace {
        anchors.centerIn: parent
        anchors.fill: parent
        isActive: parent.isActive
      }
    }
  }
}
