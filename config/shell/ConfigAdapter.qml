import QtQuick
import Quickshell
import Quickshell.Io
import ".."

JsonAdapter {
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
    readonly property JsonObject grid: JsonObject {
      property int columns: 3
      property int rows: 2
    }
    property int buttonSize: 128
    property int iconSize: Values.icon.size.large
  }
}
