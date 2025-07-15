pragma Singleton

import Quickshell

Singleton {
  readonly property list<DesktopEntry> entries: DesktopEntries.applications.values

  function launch(entry: DesktopEntry): void {
    if (entry.runInTerminal) Quickshell.execDetached(["wezterm", "zsh", "-C", entry.execString]);
    else if (entry.execString.startsWith("sh -c")) Quickshell.execDetached(["sh", "-c", entry.execString]);
    else Quickshell.execDetached([entry.execString]);
  }
}
