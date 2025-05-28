import QtQuick
import "root:/config"

Image {
  cache: false
  asynchronous: true
  retainWhileLoading: true
  anchors.fill: parent
  fillMode: Image.PreserveAspectCrop
  source: Shell.config.wallpaper.src
}
