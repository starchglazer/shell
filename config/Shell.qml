pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import "shell"

Singleton {
  property string name: "mist-shell"
  property alias config: configAdapter
  property alias states: statesAdapter
  property alias facets: facetsAdapter

  // Component.onCompleted: {
  //   configFile.writeAdapter();
  //   statesFile.writeAdapter();
  //   facetsFile.writeAdapter();
  // }

  FileView {
    id: configFile
    path: `${Paths.config}/config.json`

    blockLoading: true
    watchChanges: true

    onFileChanged: reload()
    onAdapterUpdated: configFile.writeAdapter()

    adapter: ConfigAdapter {
      id: configAdapter
    }
  }

  FileView {
    id: facetsFile
    path: `${Paths.config}/facets.json`

    blockLoading: true
    watchChanges: true

    onFileChanged: reload()
    onAdapterUpdated: facetsFile.writeAdapter()

    adapter: FacetsAdapter {
      id: facetsAdapter
    }
  }

  FileView {
    id: statesFile
    path: `${Paths.state}/states.json`

    blockLoading: true
    watchChanges: true

    onFileChanged: reload()
    onAdapterUpdated: statesFile.writeAdapter()

    adapter: StatesAdapter {
      id: statesAdapter
    }
  }
}
