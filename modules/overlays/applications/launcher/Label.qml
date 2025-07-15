import "root:/components"
import "root:/config"

StyledText {
  id: root

  property string label
  property bool hasLabel: !!root.label

  text: hasLabel ? root.label : ""
  font.pointSize: Values.font.size.medium
}
