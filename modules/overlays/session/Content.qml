import QtQuick
import QtQuick.Layouts
import "root:/components"
import "root:/config"

ColumnLayout {
  StyledText {
    text: "Boo!"
    font.pointSize: Values.font.size.huge
  }
  StyledText {
    text: "(session placeholder)"
    font.pointSize: Values.font.size.smallest
  }
}
