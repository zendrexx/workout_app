import 'package:client/features/workout_program/domain/entities/program.dart';

/// How demanding a program is, derived from its weekly training frequency.
enum ProgramDifficulty { beginner, intermediate, advanced }

/// Read-only summary of a [Program]'s structure, derived entirely from its
/// weeks/sessions/exercises. Used by discovery UI (Browse Programs) so no
/// extra metadata has to be stored on the program itself.
class ProgramOverview {
  final int weeks;
  final int trainingDaysPerWeek;
  final int totalWorkouts;

  /// Human label for the training split, e.g. "Push · Pull · Legs".
  final String splitLabel;

  /// Distinct equipment used across the whole program, most-used first.
  final List<String> equipment;

  final ProgramDifficulty difficulty;

  const ProgramOverview({
    required this.weeks,
    required this.trainingDaysPerWeek,
    required this.totalWorkouts,
    required this.splitLabel,
    required this.equipment,
    required this.difficulty,
  });
}

ProgramOverview summarizeProgram(Program program) {
  var weeks = 0;
  var totalWorkouts = 0;
  var trainingDays = 0;

  for (final week in program.week) {
    if (week.weekNumber > weeks) weeks = week.weekNumber;
    totalWorkouts += week.sessions.length;
    if (week.sessions.length > trainingDays) {
      trainingDays = week.sessions.length;
    }
  }

  return ProgramOverview(
    weeks: weeks,
    trainingDaysPerWeek: trainingDays,
    totalWorkouts: totalWorkouts,
    splitLabel: _splitLabel(program, trainingDays),
    equipment: _equipment(program),
    difficulty: _difficulty(trainingDays),
  );
}

ProgramDifficulty _difficulty(int trainingDaysPerWeek) {
  if (trainingDaysPerWeek <= 3) return ProgramDifficulty.beginner;
  if (trainingDaysPerWeek <= 5) return ProgramDifficulty.intermediate;
  return ProgramDifficulty.advanced;
}

String _splitLabel(Program program, int trainingDaysPerWeek) {
  final names = program.week
      .expand((w) => w.sessions)
      .map((s) => s.name.toLowerCase())
      .join(' ');

  if (names.contains('push') && names.contains('pull')) {
    return 'Push · Pull · Legs';
  }
  if (names.contains('upper') && names.contains('lower')) {
    return 'Upper · Lower';
  }
  if (names.contains('full body')) {
    return 'Full Body';
  }
  return '$trainingDaysPerWeek-Day Split';
}

List<String> _equipment(Program program) {
  // Count usage per equipment (case-insensitive), keeping the first casing.
  final counts = <String, int>{};
  final labels = <String, String>{};

  for (final week in program.week) {
    for (final session in week.sessions) {
      for (final exercise in session.exercises) {
        final name = exercise.equipment.trim();
        if (name.isEmpty) continue;
        final key = name.toLowerCase();
        counts[key] = (counts[key] ?? 0) + 1;
        labels.putIfAbsent(key, () => name);
      }
    }
  }

  final keys = counts.keys.toList()
    ..sort((a, b) => counts[b]!.compareTo(counts[a]!));
  return keys.map((k) => labels[k]!).toList();
}
