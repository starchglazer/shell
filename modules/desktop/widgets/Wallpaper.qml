import QtQuick
import "root:/config"

Image {
  cache: false
  asynchronous: true
  retainWhileLoading: true
  anchors.fill: parent
  fillMode: Image.PreserveAspectCrop
  source: `${Paths.pictures}/walls/8.jpg`
}
