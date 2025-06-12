pragma Singleton
pragma ComponentBehavior: Bound

import Qt.labs.platform
import QtQuick
import Quickshell

Singleton {
  property string name: Shell.name

  readonly property string pictures: getPath(StandardPaths.PicturesLocation)
  readonly property string config: `${getPath(StandardPaths.ConfigLocation)}/${name}`
  readonly property string state: `${getPath(StandardPaths.StateLocation)}/${name}`
  readonly property string cache: `${getPath(StandardPaths.CacheLocation)}/${name}`

  function getPath(path) {
    return StandardPaths.standardLocations(path)[0];
  }
}
