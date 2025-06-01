import QtQuick
import "root:/config"

StyledText {
  id: root

  required property string icon
  property bool fill
  property int weight
  property int grade
  property int opsz
  property int size

  anchors.centerIn: parent

  text: root.icon
  font.family: Values.font.family.icon
  font.pointSize: !!root.size ? root.size : Values.icon.size.regular
  font.variableAxes: {
    "fill": !!root.fill ? root.fill : Values.icon.fill.outline,
    "wght": !!root.weight ? root.weight : Values.icon.weight.regular,
    "grad": !!root.grade ? root.grade : Values.icon.grade.regular,
    "opsz": !!root.opsz ? root.opsz : !!root.size ? root.size : Values.icon.opticalSize.regular,
  }
}
