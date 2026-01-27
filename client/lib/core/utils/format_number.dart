String formatDoubleNumber(num value) {
  if (value == value.toInt()) {
    return value.toInt().toString(); // no decimal
  } else {
    return value.toString(); // keeps decimal
  }
}
