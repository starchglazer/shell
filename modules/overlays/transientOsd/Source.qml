import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.components
import qs.config
import qs.services

RowLayout {
  property var audio: Audio.source.audio
  property bool muted: Audio.getMuted(audio)
  property real volume: Audio.getVolume(audio)
  property bool isDisabled: (muted || volume <= 0)

  spacing: Values.spacing.gap.medium

  WrapperRectangle {
    color: Colors.none

    StyledIcon {
      icon: isDisabled ? "Mic_Off" : "Mic"
      color: isDisabled ? Colors.white.light : Colors.white.pure
      size: Values.icon.size.smallest
    }
  }

  LinearProgress {
    current: volume
    enabled: !isDisabled
  }
}
