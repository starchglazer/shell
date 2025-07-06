import QtQuick
import Quickshell
import "overlays"
import "root:/config"

Scope {
  property QtObject visibilities: Shell.states.visibilities

  LazyLoader { loading: visibilities.session; Session {} }
  LazyLoader { loading: visibilities.applications; Applications {} }
  LazyLoader { loading: !!visibilities.transientOSD; TransientOSD {} }
}
