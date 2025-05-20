import Quickshell.Wayland

WlrLayershell {
  required property string name

  namespace: `mist-shell-${name}`
  color: "transparent"
}
