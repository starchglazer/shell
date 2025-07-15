import QtQuick
import "root:/components"
import "root:/config"

Rectangle {
  property bool isActive

  height: 128
  width: 128
  color: isActive ? Colors.black.dark : Colors.black.medium
  border.color: isActive ? Colors.white.pure : Colors.white.medium
  border.width: isActive ? 2 : 1
  radius: Values.rounding.large
}
