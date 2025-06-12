import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import "root:/config"

WrapperRectangle {
  id: container

  color: Colors.black.bare
  margin: Values.spacing.padding.largest
  radius: Values.rounding.large

  ColumnLayout {
    spacing: Values.spacing.gap.small

    Date {}
    Time {}
  }
}
