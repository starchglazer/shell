import QtQuick
import qs.config

Image {
  cache: true
  asynchronous: true
  retainWhileLoading: true
  anchors.fill: parent
  fillMode: Image.PreserveAspectCrop
  source: Shell.states.wallpaper
}
