import Quickshell.Wayland
import "root:/config"

WlrLayershell {
  required property string name

  namespace: `${Shell.name}-${name}`
  color: Colors.none
}
