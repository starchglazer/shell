function setDetails(target, usedBytes, totalBytes, multiplier = 1024) {
  const used = convertFromBytes(usedBytes * multiplier);
  const total = convertFromBytes(totalBytes * multiplier);

  target.used.text = used.text;
  target.used.unit = used.unit;

  target.total.text = total.text;
  target.total.unit = total.unit;
}

function convertFromBytes(bytes) {
  const GiB = 1073741824, MiB = 1048576, KiB = 1024;
  const data = {};

  if (bytes >= GiB) {
    data.text = (bytes / GiB).toFixed(0);
    data.unit = "GiB";
  } else if (bytes >= MiB) {
    data.text = (bytes / MiB).toFixed(0);
    data.unit = "MiB";
  } else {
    data.text = (bytes / KiB).toFixed(0);
    data.unit = "KiB";
  }

  return data;
}
