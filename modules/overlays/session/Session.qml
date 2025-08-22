import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import qs.components
import qs.config
import "root:/functions/session.js" as Functions

WrapperRectangle {
  id: root

  required property string icon
  required property list<string> command
  required property bool focused
  required property int current

  radius: Values.rounding.large
  margin: Values.spacing.padding.large
  color: root.focused ? Colors.black.dark : Colors.black.medium
  border.width: root.focused ? 2 : 1
  border.color: root.focused ? Colors.white.medium : Colors.white.dark

  implicitWidth: Shell.config.session.buttonSize
  implicitHeight: Shell.config.session.buttonSize

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor

    hoverEnabled: true
    onEntered: Shell.states.focused.session = current
    onClicked: Functions.click(current)

    StyledIcon {
      icon: root.icon
      size: Shell.config.session.iconSize
      color: root.focused ? Colors.white.pure : Colors.white.medium
    }
  }
}
