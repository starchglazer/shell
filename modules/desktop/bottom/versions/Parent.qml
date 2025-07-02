import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Widgets
import "root:/config"

WrapperRectangle {
  color: Colors.black.bare
  margin: Values.spacing.padding.largest
  radius: Values.rounding.large

  RowLayout {
    Layout.minimumWidth: 1
    spacing: Values.spacing.gap.large

    Os {}

    ToolSeparator {
      orientation: Qt.Vertical
      Layout.fillHeight: true
    }

    Wm {}
  }
}
