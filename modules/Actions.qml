import QtQuick
import Quickshell
import qs.components
import qs.config
import qs.services

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

    Connections {
      target: Hyprland
      function onActiveWorkspaceChanged() {
        root.visibilities.transientOSD = "Spaces";
        transientOSDTimer.restart();
      }
    }

    Connections {
      target: Brightness
      function onCurrentChanged() {
        root.visibilities.transientOSD = "Lights";
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
