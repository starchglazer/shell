// Loosely based from soramanew's Time
// which can be found in https://github.com/caelestia-dots/shell
// License: None (as of the moment I yoinked it), but a copy of the license will be found in `licenses` folder of the repo as soon as they decide to have a license

pragma Singleton

import Quickshell

Singleton {
  function format(format: string): string {
    return Qt.formatDateTime(clock.date, format);
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
