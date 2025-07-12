import QtQuick
import "root:/config"

Image {
  cache: true
  asynchronous: true
  retainWhileLoading: true
  anchors.fill: parent
  fillMode: Image.PreserveAspectCrop
  source: Shell.states.wallpaper
}
