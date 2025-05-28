pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  FileView {
    id: file
    path: `${Paths.state}/shell.json`

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

  readonly property var config: JSON.parse(file.text())
}
