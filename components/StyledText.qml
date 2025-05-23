// Loosely based from soramanew's StyledText
// which can be found in https://github.com/caelestia-dots/shell
// License: None (as of the moment I yoinked it), but a copy of the license will be found in `licenses` folder of the repo as soon as they decide to have a license

import QtQuick
import "root:/config"

Text {
  renderType: Text.NativeRendering
  color: "white"
  font.family: Values.font.family.sans
  font.pointSize: Values.font.family.regular
  font.weight: Values.font.weight.regular
}
