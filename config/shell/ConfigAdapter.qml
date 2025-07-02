import QtQuick
import Quickshell
import Quickshell.Io
import ".."

JsonAdapter {
  property JsonObject wallpaper: JsonObject {
    property string dir: `${Paths.pictures}/walls`
    property string file: "3.png"
  }
  property JsonObject datetime: JsonObject {
    property JsonObject time: JsonObject {
      property string hour: "hh"
      property string minute: "mm"
      property string second: "ss"
    }
    property JsonObject date: JsonObject {
      property bool hasFullDay: true
      property list<string> format: [
        "yyyy",
        "MMMM",
        "dd"
      ]
    }
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
        "command": ["systemctl", "suspend"],
      },
      {
        "label": "Logout",
        "icon": "logout",
        "command": [],
      },
      {
        "label": "Power Off",
        "icon": "power_settings_new",
        "command": ["poweroff"],
      },
      {
        "label": "Reboot",
        "icon": "restart_alt",
        "command": ["reboot"],
      },
      {
        "label": "Hibernate",
        "icon": "downloading",
        "command": ["systemctl", "hibernate"],
      }
    ]
    property JsonObject grid: JsonObject {
      property int columns: 3
      property int rows: 2
    }
  }
}
