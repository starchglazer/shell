import QtQuick
import QtQuick.Controls
import "root:/config"

ProgressBar {
  id: root

  property real rangeFrom: 1
  property real rangeTo: 100
  property real current
  property bool enabled: true

  from: rangeFrom
  to: rangeTo
  value: current

  background: Rectangle {
    implicitWidth: 144
    implicitHeight: 4
    radius: Values.rounding.large
    color: Colors.white.dark
  }

  contentItem: Item {
    implicitWidth: 140
    implicitHeight: 2

    Rectangle {
      width: root.visualPosition * parent.width
      height: parent.height
      radius: Values.rounding.large
      color: root.enabled ? Colors.white.pure : Colors.white.medium
    }
  }
}
