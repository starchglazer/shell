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

  Scope {
    Connections {
      target: Audio
      function onSinkMutedChanged() {
        root.visibilities.transientOSD = "Sounds";
        transientOSDTimer.restart();
      }
      function onSourceMutedChanged() {
        root.visibilities.transientOSD = "Source";
        transientOSDTimer.restart();
      }
      function onSinkVolumeChanged() {
        root.visibilities.transientOSD = "Sounds";
        transientOSDTimer.restart();
      }
      function onSourceVolumeChanged() {
        root.visibilities.transientOSD = "Source";
        transientOSDTimer.restart();
      }
    }

    Timer {
      id: transientOSDTimer
      interval: 1250
      triggeredOnStart: false
      onTriggered: {
        root.visibilities.lastTransientOSD = root.visibilities.transientOSD;
        root.visibilities.transientOSD = "";
      }
    }
  }
}
