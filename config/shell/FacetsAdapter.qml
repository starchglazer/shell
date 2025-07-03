import QtQuick
import Quickshell
import Quickshell.Io
import ".."

JsonAdapter {
  property JsonObject datetime: JsonObject {
    property JsonObject size: JsonObject {
      property int time: Values.font.size.larger
      property int date: Values.font.size.medium
      property int fullDay: Values.font.size.smaller
    }
    property JsonObject weight: JsonObject {
      property int time: Values.font.weight.medium
      property int separator: Values.font.weight.smaller
      property int date: Values.font.weight.smaller
    }
    property JsonObject spacing: JsonObject {
      property int parent: Values.spacing.gap.small
      property int date: Values.spacing.gap.small
      property int time: Values.spacing.gap.none
    }
    property JsonObject padding: JsonObject {
      property int parent: Values.spacing.padding.largest
    }
    property JsonObject rounding: JsonObject {
      property int parent: Values.rounding.large
    }
  }
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
