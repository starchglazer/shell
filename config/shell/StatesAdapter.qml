import QtQuick
import Quickshell
import Quickshell.Io
import "../"

JsonAdapter {
  readonly property string wallpaper: `${Shell.config.wallpaper.dir}/${Shell.config.wallpaper.file}`

  property JsonObject visibilities: JsonObject {
    property bool session: false
    property bool applications: false
    property string transientOSD
    property string lastTransientOSD
  }

  property JsonObject focused: JsonObject {
    property int session: 0
    property int applications: 0
  }
}
