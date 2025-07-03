import QtQuick
import Quickshell
import Quickshell.Io
import ".."

JsonAdapter {
  property JsonObject session: JsonObject {
    property JsonObject size: JsonObject {
      property int button: 128
      property int icon: Values.icon.size.large
      property int label: Values.font.size.medium
    }
    property JsonObject spacing: JsonObject {
      property int parent: Values.spacing.gap.large
      property int buttons: Values.spacing.gap.medium
    }
  }
}
