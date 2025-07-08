import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import "root:/components"
import "root:/config"
import "root:/services"

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
