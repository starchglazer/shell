pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Widgets
import "root:/components"
import "root:/config"

Variants {
  model: Quickshell.screens

  StyledWindow {
    id: root

    required property ShellScreen modelData
    property string label

    visible: Shell.states.visibilities.session

    reloadableId: "Session"
    name: "Session"
    screen: modelData
    exclusionMode: ExclusionMode.Ignore
    keyboardFocus: WlrKeyboardFocus.Exclusive
    layer: WlrLayer.Overlay
    color: Colors.black.bare

    anchors {
      top: true
      right: true
      bottom: true
      left: true
    }

    MouseArea {
      id: mousearea
      anchors.fill: parent
      onClicked: Shell.states.visibilities.session = false
    }

    ColumnLayout {
      anchors.centerIn: parent
      spacing: Values.spacing.margin.large

      GridLayout {
        id: grid

        rows: 2
        columns: 3

        rowSpacing: Values.spacing.gap.large
        columnSpacing: Values.spacing.gap.large

        uniformCellWidths: true
        uniformCellHeights: true

        SessionButton {
          id: lock

          focus: true
          icon: "lock"
          label:"Lock"

          command: [""]

          KeyNavigation.up: poweroff
          KeyNavigation.right: sleep
          KeyNavigation.down: poweroff
          KeyNavigation.left: logout
        }

        SessionButton {
          id: sleep

          icon: "bedtime"
          label: "Sleep"
          command: [""]

          KeyNavigation.up: reboot
          KeyNavigation.right: logout
          KeyNavigation.down: reboot
          KeyNavigation.left: lock
        }

        SessionButton {
          id: logout

          icon: "logout"
          label: "Logout"
          command: [""]

          KeyNavigation.up: hibernate
          KeyNavigation.right: lock
          KeyNavigation.down: hibernate
          KeyNavigation.left: sleep
        }

        SessionButton {
          id: poweroff

          icon: "power_settings_new"
          label: "Power Off"
          command: [""]

          KeyNavigation.up: lock
          KeyNavigation.right: reboot
          KeyNavigation.down: lock
          KeyNavigation.left: hibernate
        }

        SessionButton {
          id: reboot

          icon: "restart_alt"
          label: "Reboot"
          command: [""]

          KeyNavigation.up: sleep
          KeyNavigation.right: hibernate
          KeyNavigation.down: sleep
          KeyNavigation.left: poweroff
        }

        SessionButton {
          id: hibernate

          icon: "downloading"
          label: "Hibernate"
          command: [""]

          KeyNavigation.up: logout
          KeyNavigation.right: poweroff
          KeyNavigation.down: logout
          KeyNavigation.left: reboot
        }
      }

      StyledText {
        Layout.alignment: Qt.AlignCenter
        text: root.label
        font.pointSize: Values.font.size.medium
      }

      component SessionButton: WrapperRectangle {
        id: session

        required property string icon
        required property string label
        required property list<string> command

        radius: Values.rounding.large
        margin: Values.spacing.margin.large
        color: Colors.black.dark
        border.width: session.activeFocus ? 2 : 1
        border.color: session.activeFocus ? Colors.white.medium : Colors.white.dark

        implicitWidth: 128
        implicitHeight: 128

        function onClicked(event: MouseEvent): void {
          Shell.states.visibilities.session = false;
          console.log(this.label);
          // process.startDetached();
        }

        MouseArea {
          id: mousearea

          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          hoverEnabled: true

          onEntered: session.focus = true
          onClicked: event => session.onClicked(event)

          StyledIcon {
            icon: session.icon
            size: Values.icon.size.medium
            color: session.focus ? Colors.white.pure : Colors.white.medium
          }
        }

        onFocusChanged: root.label = session.label

        Process {
          id: process
          command: session.command
        }

        Keys.onPressed: (event) => {
          if (event.key === Qt.Key_Escape)
            Shell.states.visibilities.session = false;
        }
      }
    }
  }
}
