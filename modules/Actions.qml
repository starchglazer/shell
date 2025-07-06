import QtQuick
import Quickshell
import "root:/components"
import "root:/config"
import "root:/services"

Scope {
  id: root

  property QtObject visibilities: Shell.states.visibilities

  Shortcut {
    name: "session"
    description: "Toggle overlay for session management"
    onPressed: {
      root.visibilities.session = !root.visibilities.session;
    }
  }

  Shortcut {
    name: "applications"
    description: "Toggle overlay for applications management"
    onPressed: {
      root.visibilities.applications = !root.visibilities.applications;
    }
  }
}
