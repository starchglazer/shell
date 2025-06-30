import QtQuick
import Quickshell
import Quickshell.Io
import ".."

JsonAdapter {
  readonly property JsonObject session: JsonObject {
    readonly property JsonObject size: JsonObject {
      readonly property int button: 128
      readonly property int icon: Values.icon.size.large
      readonly property int label: Values.font.size.medium
    }
  }
}
