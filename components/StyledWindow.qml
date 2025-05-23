// Taken from soramanew's StyledWindow
// which can be found in https://github.com/caelestia-dots/shell
// License: None (as of the moment I yoinked it), but a copy of the license will be found in `licenses` folder of the repo as soon as they decide to have a license

import Quickshell.Wayland

WlrLayershell {
  required property string name

  namespace: `mist-shell-${name}`
  color: "transparent"
}
