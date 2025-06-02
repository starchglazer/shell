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
      }

      property JsonObject session: JsonObject {
        readonly property var entries: [
          {
            "label": "Lock",
            "icon": "lock",
            "command": [],
          },
          {
            "label": "Sleep",
            "icon": "bedtime",
            "command": [],
          },
          {
            "label": "Logout",
            "icon": "logout",
            "command": [],
          },
          {
            "label": "Power Off",
            "icon": "power_settings_new",
            "command": [],
          },
          {
            "label": "Reboot",
            "icon": "restart_alt",
            "command": [],
          },
          {
            "label": "Hibernate",
            "icon": "downloading",
            "command": [],
          }
        ]
        property JsonObject grid: JsonObject {
          property int columns: 3
          property int rows: 2
        }
        property int buttonSize: 128
        property int iconSize: Values.icon.size.large
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

      readonly property string wallpaper: `${configAdapter.wallpaper.dir}/${configAdapter.wallpaper.file}`

      property JsonObject visibilities: JsonObject {
        property bool session: false
      }

      property JsonObject focused: JsonObject {
        property int session: 0
      }
    }
  }
}
