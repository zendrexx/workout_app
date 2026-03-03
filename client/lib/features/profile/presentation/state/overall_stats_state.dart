class OverallStatsState {
  final double totalVolume;
  final int totalSets;
  final int totalSeconds;
  final double? prSquat;
  final double? prBench;
  final double? prDeadlift;
  final List<DateTime> dates;
  final int streak;
  const OverallStatsState({
    required this.totalVolume,
    required this.totalSets,
    required this.totalSeconds,
    required this.dates,
    this.prSquat,
    this.prBench,
    this.prDeadlift,
    required this.streak,
  });

  factory OverallStatsState.empty() => OverallStatsState(
    totalVolume: 0,
    totalSets: 0,
    totalSeconds: 0,
    dates: List.empty(),
    streak: 0,
  );
}
