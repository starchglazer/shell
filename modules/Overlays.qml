import QtQuick
import Quickshell
import "overlays"

Item {
  LazyLoader { loading: true; Session {} }
  LazyLoader { loading: true; Applications {} }
}
