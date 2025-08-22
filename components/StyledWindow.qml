import Quickshell.Wayland
import qs.config

WlrLayershell {
  required property string name

  namespace: `${Shell.name}-${name}`
  color: Colors.none
}
