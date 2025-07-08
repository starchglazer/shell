pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland
import "root:/config"

Singleton {
  readonly property int fixedWorkspaces: Shell.config.hyprland.fixedWorkspaces
  readonly property int activeWorkspace: Hyprland.focusedWorkspace?.id ?? 1
}
