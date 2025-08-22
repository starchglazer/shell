import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.components
import qs.config
import qs.services

RowLayout {
  spacing: Values.spacing.gap.medium

  WrapperRectangle {
    color: Colors.none

    StyledIcon {
      icon: "Brightness_Medium"
      color: Colors.white.light
      size: Values.icon.size.smallest
    }
  }

  LinearProgress {
    rangeFrom: Brightness.minimum
    rangeTo: Brightness.maximum
    current: Brightness.current
  }
}
