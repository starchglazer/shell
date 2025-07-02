pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
  readonly property PwNode sink: Pipewire.defaultAudioSink
  readonly property PwNode source: Pipewire.defaultAudioSource
  readonly property bool isReady: Pipewire.ready

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
  }

  function setVolume(volume: real, forSink: bool): void {
    if (!isReady) return;

    if (forSink) {
      sink.audio.muted = false;
      sink.audio.volume = volume;
    } else {
      source.audio.muted = false;
      source.audio.volume = volume;
    }
  }
}
