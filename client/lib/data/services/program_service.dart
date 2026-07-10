import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/features/workout_program/data/models/active_program_isar.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/data/models/program_session_isar.dart';
import 'package:client/features/workout_program/data/models/program_week_isar.dart';
import 'package:isar/isar.dart';

/// Weight added per week of a program (simple progressive overload).
const double _weeklyProgression = 2.5;

/// Seeds the three built-in workout programs (4/6/8 weeks) and, on a fresh
/// install, marks the first one as the user's active program so the Start
/// Workout flow works with zero manual setup.
Future<void> seedPrograms(Isar isar) async {
  final existing = await isar.programIsars.getByProgramId(_programs.first.programId);
  if (existing == null) {
    final all = await isar.exerciseIsars.where().findAll();
    final library = {for (final e in all) e.exId: e};

    final programs = _programs.map((p) => _buildProgram(p, library)).toList();

    await isar.writeTxn(() async {
      await isar.programIsars.putAll(programs);
    });
    print("Seeded ${programs.length} default programs into Isar");
  } else {
    print("Default programs already seeded");
  }

  final activeCount = await isar.activeProgramIsars.count();
  if (activeCount == 0) {
    final active = ActiveProgramIsar(
      activeProgramId: 'active_default',
      templateProgramId: _programs.first.programId,
      currentWeek: 1,
      currentDay: 1,
      startedAt: DateTime.now(),
    );
    await isar.writeTxn(() async {
      await isar.activeProgramIsars.put(active);
    });
    print("Activated default program '${_programs.first.programId}'");
  }
}

ProgramIsar _buildProgram(_ProgramSpec spec, Map<String, ExerciseIsar> library) {
  final weeks = <ProgramWeekIsar>[];
  for (var w = 1; w <= spec.weeks; w++) {
    final sessions = spec.sessions
        .map((s) => _buildSession(s, w, library))
        .toList();
    weeks.add(
      ProgramWeekIsar(weekId: '${spec.programId}_w$w', weekNumber: w)
        ..sessions = sessions,
    );
  }
  return ProgramIsar(programId: spec.programId, name: spec.name)..weeks = weeks;
}

ProgramSessionIsar _buildSession(
  _SessionSpec spec,
  int week,
  Map<String, ExerciseIsar> library,
) {
  final exercises = spec.exercises
      .map((e) => _buildExercise(e, week, library))
      .toList();
  return ProgramSessionIsar()
    ..sessionId = IdGenerator().getId()
    ..name = spec.name
    ..createdAt = DateTime.now()
    ..dayNumber = spec.day
    ..exercises = exercises;
}

PlannedExerciseIsar _buildExercise(
  _ExSpec spec,
  int week,
  Map<String, ExerciseIsar> library,
) {
  final ex = library[spec.exId];
  final weight = spec.baseWeight == 0
      ? 0.0
      : spec.baseWeight + _weeklyProgression * (week - 1);
  final sets = List.generate(
    spec.sets,
    (_) => PlannedSetIsar(
      estWeight: weight,
      minRep: spec.minRep,
      maxRep: spec.maxRep,
    ),
  );
  return PlannedExerciseIsar(
    exId: spec.exId,
    exerciseName: ex?.name ?? spec.exId,
    equipment: ex?.equipment ?? 'Barbell',
    imagePath: ex?.imagePath ?? 'assets/images/workouticon.png',
    notes: '',
  )..sets = sets;
}

// ---------------------------------------------------------------------------
// Program definitions (weekly template; rest days are any day 1..7 with no
// session). estWeight is a week-1 starting weight and progresses weekly.
// ---------------------------------------------------------------------------

class _ExSpec {
  final String exId;
  final int sets;
  final int minRep;
  final int maxRep;
  final double baseWeight;
  const _ExSpec(
    this.exId,
    this.sets,
    this.minRep,
    this.maxRep, [
    this.baseWeight = 0,
  ]);
}

class _SessionSpec {
  final String name;
  final int day;
  final List<_ExSpec> exercises;
  const _SessionSpec(this.name, this.day, this.exercises);
}

class _ProgramSpec {
  final String programId;
  final String name;
  final int weeks;
  final List<_SessionSpec> sessions;
  const _ProgramSpec(this.programId, this.name, this.weeks, this.sessions);
}

const _programs = <_ProgramSpec>[
  // Program 1 — 4 weeks, full body 3x/week (days 1, 3, 5; rest 2,4,6,7)
  _ProgramSpec('beginner_4wk', 'Beginner Full Body (4 Weeks)', 4, [
    _SessionSpec('Full Body A', 1, [
      _ExSpec('squat', 3, 8, 10, 60),
      _ExSpec('bench_press', 3, 8, 10, 40),
      _ExSpec('barbell_row', 3, 8, 10, 40),
      _ExSpec('plank', 3, 30, 60),
    ]),
    _SessionSpec('Full Body B', 3, [
      _ExSpec('deadlift', 3, 5, 6, 80),
      _ExSpec('overhead_press', 3, 8, 10, 30),
      _ExSpec('lat_pulldown', 3, 10, 12, 45),
      _ExSpec('leg_curl', 3, 12, 15, 30),
    ]),
    _SessionSpec('Full Body C', 5, [
      _ExSpec('front_squat', 3, 8, 10, 45),
      _ExSpec('incline_bench_press', 3, 8, 10, 35),
      _ExSpec('seated_cable_row', 3, 10, 12, 45),
      _ExSpec('calf_raise', 3, 12, 15, 40),
    ]),
  ]),

  // Program 2 — 6 weeks, upper/lower 4x/week (days 1, 2, 4, 5; rest 3,6,7)
  _ProgramSpec('intermediate_6wk', 'Upper / Lower Split (6 Weeks)', 6, [
    _SessionSpec('Upper A', 1, [
      _ExSpec('bench_press', 4, 6, 8, 50),
      _ExSpec('barbell_row', 4, 6, 8, 45),
      _ExSpec('overhead_press', 3, 8, 10, 30),
      _ExSpec('barbell_curl', 3, 10, 12, 20),
      _ExSpec('tricep_pushdown', 3, 10, 12, 25),
    ]),
    _SessionSpec('Lower A', 2, [
      _ExSpec('squat', 4, 6, 8, 70),
      _ExSpec('romanian_deadlift', 3, 8, 10, 60),
      _ExSpec('leg_press', 3, 10, 12, 100),
      _ExSpec('calf_raise', 4, 12, 15, 45),
    ]),
    _SessionSpec('Upper B', 4, [
      _ExSpec('incline_bench_press', 4, 8, 10, 40),
      _ExSpec('lat_pulldown', 4, 8, 10, 50),
      _ExSpec('dumbbell_shoulder_press', 3, 10, 12, 20),
      _ExSpec('hammer_curl', 3, 10, 12, 15),
      _ExSpec('overhead_tricep_extension', 3, 10, 12, 20),
    ]),
    _SessionSpec('Lower B', 5, [
      _ExSpec('deadlift', 4, 5, 5, 90),
      _ExSpec('front_squat', 3, 8, 10, 50),
      _ExSpec('leg_curl', 3, 10, 12, 35),
      _ExSpec('hip_thrust', 3, 10, 12, 70),
    ]),
  ]),

  // Program 3 — 8 weeks, push/pull/legs 6x/week (days 1-6; rest day 7)
  _ProgramSpec('advanced_8wk', 'Push Pull Legs (8 Weeks)', 8, [
    _SessionSpec('Push A', 1, [
      _ExSpec('bench_press', 4, 6, 8, 60),
      _ExSpec('overhead_press', 3, 8, 10, 35),
      _ExSpec('incline_bench_press', 3, 8, 10, 40),
      _ExSpec('lateral_raise', 3, 12, 15, 10),
      _ExSpec('tricep_pushdown', 3, 10, 12, 30),
    ]),
    _SessionSpec('Pull A', 2, [
      _ExSpec('deadlift', 3, 5, 5, 100),
      _ExSpec('pull_up', 3, 6, 10),
      _ExSpec('barbell_row', 3, 8, 10, 55),
      _ExSpec('face_pull', 3, 12, 15, 20),
      _ExSpec('barbell_curl', 3, 10, 12, 25),
    ]),
    _SessionSpec('Legs A', 3, [
      _ExSpec('squat', 4, 6, 8, 80),
      _ExSpec('romanian_deadlift', 3, 8, 10, 70),
      _ExSpec('leg_press', 3, 10, 12, 120),
      _ExSpec('leg_curl', 3, 12, 15, 35),
      _ExSpec('calf_raise', 4, 12, 15, 50),
    ]),
    _SessionSpec('Push B', 4, [
      _ExSpec('dumbbell_bench_press', 4, 8, 10, 30),
      _ExSpec('dumbbell_shoulder_press', 3, 10, 12, 22),
      _ExSpec('cable_crossover', 3, 12, 15, 15),
      _ExSpec('lateral_raise', 3, 12, 15, 10),
      _ExSpec('overhead_tricep_extension', 3, 10, 12, 22),
    ]),
    _SessionSpec('Pull B', 5, [
      _ExSpec('barbell_row', 4, 8, 10, 55),
      _ExSpec('lat_pulldown', 3, 10, 12, 55),
      _ExSpec('seated_cable_row', 3, 10, 12, 55),
      _ExSpec('rear_delt_fly', 3, 12, 15, 10),
      _ExSpec('hammer_curl', 3, 10, 12, 16),
    ]),
    _SessionSpec('Legs B', 6, [
      _ExSpec('front_squat', 4, 8, 10, 55),
      _ExSpec('hip_thrust', 3, 10, 12, 80),
      _ExSpec('walking_lunge', 3, 12, 12, 20),
      _ExSpec('leg_extension', 3, 12, 15, 40),
      _ExSpec('hanging_leg_raise', 3, 10, 15),
    ]),
  ]),
];
