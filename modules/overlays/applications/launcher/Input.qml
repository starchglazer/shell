import QtQuick
import QtQuick.Controls
import "root:/config"

TextField {
  focus: true
  placeholderText: "Search apps"

  implicitWidth: 480
  implicitHeight: 64

  horizontalAlignment: TextInput.AlignHCenter
  verticalAlignment: TextInput.AlignVCenter

  color: Colors.white.pure
  placeholderTextColor: Colors.white.medium

  font.family: Values.font.family.sans
  font.pointSize: Values.font.size.regular
  font.weight: Values.font.weight.regular

  background: Rectangle {
    anchors.fill: parent
    color: Colors.black.medium
    radius: Values.rounding.large
    border.color: Colors.white.medium
    border.width: 1
  }

  cursorVisible: false
  cursorDelegate: Item {}
}
