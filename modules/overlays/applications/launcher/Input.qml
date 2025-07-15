import QtQuick
import "root:/components"
import "root:/config"

Rectangle {
  id: root

  required property string text

  implicitWidth: 480
  implicitHeight: 64

  color: Colors.black.dark
  border.color: Colors.white.medium
  border.width: 1
  radius: Values.rounding.large

  StyledText {
    anchors.centerIn: parent
    text: root.text
  }
}
