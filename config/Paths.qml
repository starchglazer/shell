pragma Singleton
pragma ComponentBehavior: Bound

import Qt.labs.platform
import QtQuick
import Quickshell

Singleton {
  readonly property string pictures: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]

  readonly property string config: `${StandardPaths.standardLocations(StandardPaths.ConfigLocation)[0]}/mist-shell`
  readonly property string state: `${StandardPaths.standardLocations(StandardPaths.StateLocation)[0]}/mist-shell`
  readonly property string cache: `${StandardPaths.standardLocations(StandardPaths.CacheLocation)[0]}/mist-shell`
}
