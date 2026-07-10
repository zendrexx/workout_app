/// Total training volume (lbs) lifted in one calendar week (Monday-based).
class WeeklyVolume {
  final DateTime weekStart;
  final double volume;

  const WeeklyVolume({required this.weekStart, required this.volume});
}

/// One exercise inside a performed session, reduced to its best completed set.
class SessionExerciseSummary {
  final String name;

  /// Number of sets the user actually completed.
  final int completedSets;

  /// Heaviest completed set.
  final double topWeight;
  final int topReps;

  /// True when this session's top weight beat the exercise's previous best.
  /// The first time an exercise is ever performed sets a baseline — it is
  /// not counted as a record.
  final bool isRecord;

  /// User's note for this exercise, empty when none was written.
  final String notes;

  const SessionExerciseSummary({
    required this.name,
    required this.completedSets,
    required this.topWeight,
    required this.topReps,
    required this.isRecord,
    required this.notes,
  });

  bool get hasNotes => notes.trim().isNotEmpty;
}

/// A completed workout, reduced to what the history timeline needs.
class HistorySessionSummary {
  final String name;
  final DateTime endTime;
  final int durationSeconds;

  /// Volume of completed sets only (actual weight × actual reps).
  final double totalVolume;
  final int completedSets;

  /// Exercises where a new best weight was hit during this session.
  final int recordCount;

  /// Only exercises with at least one completed set.
  final List<SessionExerciseSummary> exercises;

  const HistorySessionSummary({
    required this.name,
    required this.endTime,
    required this.durationSeconds,
    required this.totalVolume,
    required this.completedSets,
    required this.recordCount,
    required this.exercises,
  });

  int get exerciseCount => exercises.length;
}

/// A personal record the user actually hit: the heaviest completed set of an
/// exercise, on the day it beat the previous best.
class RecordHighlight {
  final String exerciseName;
  final double weight;
  final int reps;
  final DateTime achievedAt;

  const RecordHighlight({
    required this.exerciseName,
    required this.weight,
    required this.reps,
    required this.achievedAt,
  });
}

/// Aggregated training history: everything the History page shows.
///
/// This is a read model — every value is computed from stored performed
/// sessions, so the UI never displays a number that was not earned.
class HistoryOverview {
  final int totalWorkouts;

  // Recent momentum (current calendar week, Monday-based).
  final int workoutsThisWeek;
  final double volumeThisWeek;
  final int secondsThisWeek;

  /// Consecutive calendar weeks with at least one workout, counting back
  /// from the current week. A week in progress without a workout yet does
  /// not break the streak. 0 or 1 means there is no streak worth showing.
  final int currentStreakWeeks;

  /// Consecutive calendar days with at least one workout, counting back from
  /// today. Today not yet trained does not break the streak.
  final int currentStreakDays;

  /// Every distinct day the user trained, normalised to midnight. Used to
  /// paint the home activity grid — membership means "trained that day".
  final Set<DateTime> workoutDays;

  /// Volume per calendar week, oldest first. Covers at most the last 8
  /// weeks and never reaches further back than the first recorded workout.
  final List<WeeklyVolume> weeklyVolume;

  /// Every completed workout, newest first.
  final List<HistorySessionSummary> sessions;

  /// The user's latest personal records — one per exercise, most recent
  /// first. Empty until an exercise is beaten for the first time.
  final List<RecordHighlight> recentRecords;

  const HistoryOverview({
    required this.totalWorkouts,
    required this.workoutsThisWeek,
    required this.volumeThisWeek,
    required this.secondsThisWeek,
    required this.currentStreakWeeks,
    required this.currentStreakDays,
    required this.workoutDays,
    required this.weeklyVolume,
    required this.sessions,
    required this.recentRecords,
  });

  bool get isEmpty => totalWorkouts == 0;

  /// This week's volume compared to the average of the previous weeks,
  /// as a percentage (e.g. 12 = up 12%). 0 when there isn't enough data.
  double get volumeTrendPercent {
    if (weeklyVolume.length < 2) return 0;
    final current = weeklyVolume.last.volume;
    final previous =
        weeklyVolume
            .sublist(0, weeklyVolume.length - 1)
            .map((w) => w.volume)
            .reduce((a, b) => a + b) /
        (weeklyVolume.length - 1);
    if (previous == 0) return 0;
    return (current - previous) / previous * 100;
  }
}
