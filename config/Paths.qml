// Taken from end_4's XdgDirectories
// which can be found in https://github.com/end-4/dots-hyprland
// License: GPL-3.0 - A copy can be found in `licenses` folder in the repository

pragma Singleton
pragma ComponentBehavior: Bound

import Qt.labs.platform
import QtQuick
import Quickshell

Singleton {
  readonly property string config: StandardPaths.standardLocations(StandardPaths.ConfigLocation)[0]
  readonly property string state: StandardPaths.standardLocations(StandardPaths.StateLocation)[0]
  readonly property string cache: StandardPaths.standardLocations(StandardPaths.CacheLocation)[0]
  readonly property string pictures: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
}
