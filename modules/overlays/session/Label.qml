import "root:/components"
import "root:/config"

StyledText {
  id: root

  required property string label

  text: root.label
  font.pointSize: Shell.facets.session.size.label
}
