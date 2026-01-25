/// Converts total seconds into a friendly format: 1h 2m 3s
/// Omits any unit that is 0, except when totalSeconds < 60
String secondsToString(int totalSeconds) {
  final hours = totalSeconds ~/ 3600;
  final minutes = (totalSeconds % 3600) ~/ 60;
  final seconds = totalSeconds % 60;

  final parts = <String>[];

  if (hours > 0) {
    parts.add('${hours}h');
  }
  if (minutes > 0) {
    parts.add('${minutes}m');
  }
  if (seconds > 0 || totalSeconds < 60) {
    parts.add('${seconds}s');
  }

  return parts.join(' ');
}
