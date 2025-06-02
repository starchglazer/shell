function onNavigate(index, direction) {
  const cols = Shell.config.session.grid.columns;
  const rows = Shell.config.session.grid.rows;

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

  Shell.states.focused.session = newRow * cols + newCol;
}

function onPressed(key) {
  if (key === Qt.Key_Escape) return clear();

  const index = Shell.states.focused.session;

  if (key === Qt.Key_Return || key === Qt.Key_Enter || key === Qt.Key_Space) return Functions.click(index);

  if (key === Qt.Key_W || key === Qt.Key_Up) onNavigate(index, "up");
  if (key === Qt.Key_D || key === Qt.Key_Right) onNavigate(index, "right");
  if (key === Qt.Key_S || key === Qt.Key_Down) onNavigate(index, "down");
  if (key === Qt.Key_A || key === Qt.Key_Left) onNavigate(index, "left");
}

function clear() {
  Shell.states.visibilities.session = false;
  Shell.states.focused.session = 0;
}

function click(index) {
  clear();
  console.log(
    Shell.config.session.entries[index].label,
    Shell.config.session.entries[index].command
  );
}
