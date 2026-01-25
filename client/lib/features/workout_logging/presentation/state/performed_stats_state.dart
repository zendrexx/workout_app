// ignore_for_file: public_member_api_docs, sort_constructors_first
class PerformedStatsState {
  int totalSeconds;
  double totalVolume;
  int totalSets;
  PerformedStatsState({
    required this.totalSeconds,
    required this.totalVolume,
    required this.totalSets,
  });
  factory PerformedStatsState.initial() {
    return PerformedStatsState(totalSeconds: 0, totalVolume: 0, totalSets: 0);
  }
  PerformedStatsState copyWith({
    int? totalSeconds,
    double? totalVolume,
    int? totalSets,
  }) {
    return PerformedStatsState(
      totalSeconds: totalSeconds ?? this.totalSeconds,
      totalVolume: totalVolume ?? this.totalVolume,
      totalSets: totalSets ?? this.totalSets,
    );
  }
}
