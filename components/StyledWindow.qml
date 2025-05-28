import Quickshell.Wayland
import "root:/config"

WlrLayershell {
  required property string name

  namespace: `mist-shell-${name}`
  color: Colors.none
}
