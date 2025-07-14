import QtQuick
import Quickshell.Widgets
import "root:/config"
import "root:/modules/desktop/background"

ClippingRectangle {
  required property bool isActive

  border.width: isActive ? 2 : 1
  border.color: isActive ? Colors.white.pure : Colors.white.dark
  radius: Values.rounding.large
  color: Colors.black.pure

  Wallpaper {}
}
