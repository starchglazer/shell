//@ pragma Env QS_NO_RELOAD_POPUP=1

import Quickshell
import qs.modules

ShellRoot {
  settings.watchFiles: false

  Actions {}
  Overlays {}
  Desktop {}
}
