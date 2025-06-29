function onPressed(key) {
  if (key === Qt.Key_Escape) return clear();
}

function clear() {
  Shell.states.visibilities.applications = false;
}
