import "root:/components"
import "root:/config"

StyledText {
  id: root

  required property string label

  text: root.label
  font.pointSize: Values.font.size.medium
}
