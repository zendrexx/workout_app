/// The lift whose estimated one-rep max grew the most since it was first
/// logged. Requires real history — never inferred from a single session.
class MostImprovedLift {
  final String exerciseName;
  final double firstOneRmLbs;
  final double bestOneRmLbs;

  const MostImprovedLift({
    required this.exerciseName,
    required this.firstOneRmLbs,
    required this.bestOneRmLbs,
  });

  double get percentGain =>
      (bestOneRmLbs - firstOneRmLbs) / firstOneRmLbs * 100;
}

/// Lifetime training totals computed from every stored workout.
class LifterStats {
  final int totalWorkouts;
  final double totalVolumeLbs;
  final int totalSeconds;
  final int totalSets;
  final int totalReps;

  /// Workouts per calendar week, averaged from the first workout to now.
  final double avgWorkoutsPerWeek;

  /// Longest run of consecutive calendar weeks with at least one workout.
  final int longestWeekStreak;

  /// The exercise with the most completed sets over the lifter's history.
  final String? favoriteLift;

  final MostImprovedLift? mostImproved;

  final DateTime? firstWorkoutAt;

  const LifterStats({
    required this.totalWorkouts,
    required this.totalVolumeLbs,
    required this.totalSeconds,
    required this.totalSets,
    required this.totalReps,
    required this.avgWorkoutsPerWeek,
    required this.longestWeekStreak,
    required this.favoriteLift,
    required this.mostImproved,
    required this.firstWorkoutAt,
  });

  static const empty = LifterStats(
    totalWorkouts: 0,
    totalVolumeLbs: 0,
    totalSeconds: 0,
    totalSets: 0,
    totalReps: 0,
    avgWorkoutsPerWeek: 0,
    longestWeekStreak: 0,
    favoriteLift: null,
    mostImproved: null,
    firstWorkoutAt: null,
  );

  bool get hasTrained => totalWorkouts > 0;
}
