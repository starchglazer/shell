import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import "root:/config"

WrapperRectangle {
  id: container

  color: Colors.black.bare
  margin: Shell.facets.datetime.padding.parent
  radius: Shell.facets.datetime.rounding.parent

  ColumnLayout {
    spacing: Shell.facets.datetime.spacing.parent

    Time {}
    Date {}
  }
}
