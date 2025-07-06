import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import "root:/components"
import "root:/config"
import "root:/services"

RowLayout {
  property var audio: Audio.sink.audio
  property bool muted: Audio.getMuted(audio)
  property real volume: Audio.getVolume(audio)

  property bool isDisabled: (muted || volume <= 0)

  spacing: Values.spacing.gap.medium

  WrapperRectangle {
    color: Colors.none

    StyledIcon {
      icon: isDisabled ? "No_Sound" : "Volume_Up"
      color: isDisabled ? Colors.white.light : Colors.white.pure
      size: Values.icon.size.smallest
    }
  }

  LinearProgress {
    current: volume
    enabled: !isDisabled
  }
}
