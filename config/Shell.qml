pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  readonly property var config: JSON.parse(configFile.text())
  readonly property var states: JSON.parse(statesFile.text())

  FileView {
    id: configFile
    path: `${Paths.config}/config.json`

    blockLoading: true
    watchChanges: true

    onFileChanged: reload()
    onAdapterUpdated: writeAdapter()

    adapter: JsonAdapter {
      property QtObject wallpaper: QtObject {
        property string dir: `${Paths.pictures}/walls`
        property string file: "8.jpg"
        property string src: `${dir}/${file}`
      }
    }
  }

  FileView {
    id: statesFile
    path: `${Paths.state}/states.json`

    blockLoading: true
    watchChanges: true

    onFileChanged: reload()
    onAdapterUpdated: writeAdapter()

    adapter: JsonAdapter {}
  }
}
