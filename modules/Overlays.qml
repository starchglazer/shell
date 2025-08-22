import QtQuick
import Quickshell
import qs.config
import "./overlays"

Scope {
  property QtObject visibilities: Shell.states.visibilities

  LazyLoader { loading: visibilities.session; Session {} }
  LazyLoader { loading: visibilities.applications; Applications {} }
  LazyLoader { loading: !!visibilities.transientOSD; TransientOSD {} }
}
