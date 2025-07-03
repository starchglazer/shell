pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
  readonly property bool ready: Pipewire.ready
  readonly property PwNode sink: Pipewire.defaultAudioSink
  readonly property PwNode source: Pipewire.defaultAudioSource

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
  }

  function setMuted(audio: PwNodeAudio): void {
    if (!ready) return;
    audio.muted = !audio.muted;
  }

  function setVolume(audio: PwNodeAudio, volume: real): void {
    if (!ready) return;
    audio.volume = volume;
  }

  function getMuted(audio: PwNodeAudio): bool {
    if (!ready) return undefined;
    return audio.muted;
  }

  function getVolume(audio: PwNodeAudio): real {
    if (!ready) return undefined;
    return (audio.volume * 100).toFixed(0);
  }
}
