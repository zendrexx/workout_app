// ignore_for_file: public_member_api_docs, sort_constructors_first
class PerformedStatsState {
  int hours;
  int minutes;
  int seconds;
  double totalVolume;
  int totalSets;
  PerformedStatsState({
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.totalVolume,
    required this.totalSets,
  });

  PerformedStatsState copyWith({
    int? hours,
    int? minutes,
    int? seconds,
    double? totalVolume,
    int? totalSets,
  }) {
    return PerformedStatsState(
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
      totalVolume: totalVolume ?? this.totalVolume,
      totalSets: totalSets ?? this.totalSets,
    );
  }
}
