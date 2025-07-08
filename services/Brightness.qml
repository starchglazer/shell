pragma Singleton
pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property int maximum
  property int minimum: 75
  property int current

  FileView {
    path: "/sys/class/backlight/intel_backlight/max_brightness"
    onLoaded: {
      const data = text().trim();
      root.maximum = parseInt(data);
    }
  }

  FileView {
    path: "/sys/class/backlight/intel_backlight/actual_brightness"
    watchChanges: true
    onFileChanged: this.reload()
    onLoaded: root.current = parseInt(text().trim())
  }
}
