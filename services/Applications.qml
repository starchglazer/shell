pragma Singleton

import Quickshell

Singleton {
  readonly property list<DesktopEntry> entries: DesktopEntries.applications.values

  function launch(entry: DesktopEntry): void {
    if (entry.execString.startsWith("sh -c")) Quickshell.execDetached(["sh", "-c", entry.execString]);
    else Quickshell.execDetached([entry.execString]);
  }
}
