/// The lifts the profile tracks as personal records.
///
/// Squat, bench and deadlift define the powerlifting identity and drive the
/// strength classification. The rest are supporting lifts: shown when data
/// exists, never required.
enum RecordLift {
  squat,
  benchPress,
  deadlift,
  overheadPress,
  barbellRow,
  pullUp;

  String get displayName {
    switch (this) {
      case RecordLift.squat:
        return 'Squat';
      case RecordLift.benchPress:
        return 'Bench Press';
      case RecordLift.deadlift:
        return 'Deadlift';
      case RecordLift.overheadPress:
        return 'Overhead Press';
      case RecordLift.barbellRow:
        return 'Barbell Row';
      case RecordLift.pullUp:
        return 'Pull Up';
    }
  }

  /// The three competition lifts that make up the powerlifting total and
  /// the strength classification.
  bool get isCompetitionLift =>
      this == RecordLift.squat ||
      this == RecordLift.benchPress ||
      this == RecordLift.deadlift;

  /// Lifts the user may enter manually during setup (they know these
  /// numbers by heart). Supporting lifts only ever come from logged sets.
  bool get supportsManualEntry =>
      isCompetitionLift || this == RecordLift.overheadPress;

  /// Seeded exercise-library id for this lift. Matching is exact so that
  /// variations (Front Squat, Incline Bench Press, Romanian Deadlift) never
  /// count toward a competition record.
  String get exerciseId {
    switch (this) {
      case RecordLift.squat:
        return 'squat';
      case RecordLift.benchPress:
        return 'bench_press';
      case RecordLift.deadlift:
        return 'deadlift';
      case RecordLift.overheadPress:
        return 'overhead_press';
      case RecordLift.barbellRow:
        return 'barbell_row';
      case RecordLift.pullUp:
        return 'pull_up';
    }
  }

  /// Resolves a performed exercise to a tracked lift, or null when the
  /// exercise is not one of them. Falls back to the exact display name for
  /// ad-hoc exercises that were logged without a library id.
  static RecordLift? fromExercise({required String exId, required String name}) {
    final normalizedName = name.trim().toLowerCase();
    for (final lift in RecordLift.values) {
      if (exId == lift.exerciseId) return lift;
      if (exId.isEmpty && normalizedName == lift.displayName.toLowerCase()) {
        return lift;
      }
    }
    return null;
  }
}
