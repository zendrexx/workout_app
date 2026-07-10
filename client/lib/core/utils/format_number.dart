String formatDoubleNumber(num value) {
  if (value == value.toInt()) {
    return value.toInt().toString(); // no decimal
  } else {
    return value.toString(); // keeps decimal
  }
}

/// Shortens large numbers for stat displays: 38200 -> "38.2k", 3.4M etc.
String formatCompactNumber(num value) {
  if (value >= 1000000) {
    return '${_trimZero(value / 1000000)}M';
  }
  if (value >= 1000) {
    return '${_trimZero(value / 1000)}k';
  }
  return formatDoubleNumber(value);
}

String _trimZero(double v) {
  final s = v.toStringAsFixed(1);
  return s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
}

/// Groups thousands with commas for hero numbers: 1040 -> "1,040".
String formatWithCommas(num value) {
  final text = formatDoubleNumber(value);
  final buffer = StringBuffer();
  final digits = text.split('.');
  final whole = digits.first;
  for (var i = 0; i < whole.length; i++) {
    if (i > 0 && (whole.length - i) % 3 == 0) buffer.write(',');
    buffer.write(whole[i]);
  }
  if (digits.length > 1) buffer.write('.${digits[1]}');
  return buffer.toString();
}
