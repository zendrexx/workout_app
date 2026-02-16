class OverallStatsState {
  final double totalVolume;
  final int totalSets;
  final int totalSeconds;
  final List<DateTime> dates;
  const OverallStatsState({
    required this.totalVolume,
    required this.totalSets,
    required this.totalSeconds,
    required this.dates,
  });

  factory OverallStatsState.empty() => OverallStatsState(
    totalVolume: 0,
    totalSets: 0,
    totalSeconds: 0,
    dates: List.empty(),
  );
}
