function onNavigate(index, direction) {
  const cols = Shell.config.applications.grid.columns;
  const rows = Shell.config.applications.grid.rows;

  const row = Math.floor(index / cols);
  const col = index % cols;

  let newRow, newCol;

  switch (direction) {
    case "up":
      newRow = (row - 1 + rows) % rows;
      newCol = col;
      break;
    case "down":
      newRow = (row + 1) % rows;
      newCol = col;
      break;
    case "left":
      newRow = row;
      newCol = (col - 1 + cols) % cols;
      break;
    case "right":
      newRow = row;
      newCol = (col + 1) % cols;
      break;
  }

  Shell.states.focused.applications = newRow * cols + newCol;
}

function onPressed(event) {
  const { key, text } = event;
  const index = Shell.states.focused.applications;

  if (key === Qt.Key_Escape) return onClear();

  if (key === Qt.Key_Up) return onNavigate(index, "up");
  if (key === Qt.Key_Right) return onNavigate(index, "right");
  if (key === Qt.Key_Down) return onNavigate(index, "down");
  if (key === Qt.Key_Left) return onNavigate(index, "left");

  if (key === Qt.Key_Return || key === Qt.Key_Enter) return onConfirm();

  if (key === Qt.Key_Backspace) return onPressedModify(event, "delete");
  else return onPressedModify(event, "concat", text);
}

function onPressedModify(event, type, char) {
  if (!(event.modifiers === 0 || event.modifiers === 33554432)) return;

  const oldText = Shell.states.focused.application;
  let newText;

  if (type === "concat") newText = oldText.concat(char);
  else if (type === "delete") newText = oldText.slice(0, oldText.length - 1);

  Shell.states.focused.application = newText;
}

function onConfirm() {
  // Applications.launch();
}

function onClear() {
  Shell.states.visibilities.applications = false;
  Shell.states.focused.applications = 0;
  Shell.states.focused.application = "";
}

function getEntries() {
  const input = Shell.states.focused.application;
  return Applications.entries
    .filter((entry) => !entry.noDisplay)
    .filter((entry) => entry.name.toLowerCase().startsWith(input.toLowerCase()))
    // .filter((entry) => entry.name.toLowerCase().includes(input.toLowerCase()))
    .sort((a, b) => a.name.localeCompare(b.name))
    .slice(0, 5);
}
