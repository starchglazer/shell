pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  property alias config: configAdapter
  property alias states: statesAdapter

  FileView {
    id: configFile
    path: `${Paths.config}/config.json`

    blockLoading: true
    watchChanges: true

    onFileChanged: reload()
    onAdapterUpdated: configFile.writeAdapter()

    adapter: JsonAdapter {
      id: configAdapter

      property JsonObject wallpaper: JsonObject {
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
    onAdapterUpdated: statesFile.writeAdapter()

    adapter: JsonAdapter {
      id: statesAdapter

      property JsonObject visibilities: JsonObject {
        property bool session: false
      }
    }
  }
}
