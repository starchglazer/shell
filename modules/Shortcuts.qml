import Quickshell
import "root:/components"
import "root:/config"

Scope {
  id: root

  Shortcut {
    name: "session"
    description: "Toggle overlay for session management"
    onPressed: {
      const { session } = Shell.states.visibilities;
      Shell.states.visibilities.session = !session;
    }
  }

  Shortcut {
    name: "applications"
    description: "Toggle overlay for applications management"
    onPressed: {
      const { applications } = Shell.states.visibilities;
      Shell.states.visibilities.applications = !applications;
    }
  }
}
