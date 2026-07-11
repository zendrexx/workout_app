import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/features/workout_program/data/models/active_program_isar.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:client/features/workout_program/data/models/program_session_isar.dart';
import 'package:client/features/workout_program/data/models/program_week_isar.dart';
import 'package:isar/isar.dart';

/// Default weight added per week of a program (simple progressive overload).
/// Individual lifts can override this — deadlifts typically progress faster
/// than squat/bench, for example.
const double _weeklyProgression = 2.5;

/// Seeds the five built-in Forge programs and, on a fresh install, marks the
/// first one as the user's active program so the Start Workout flow works
/// with zero manual setup.
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
    // A week override (deload week, test week, mock meet…) replaces the
    // normal template outright and already encodes its own intent, so the
    // phase multiplier that shapes ordinary weeks doesn't apply to it.
    final override = spec.weekOverrides[w];
    final sessions = override ?? spec.sessions;
    final phase = override != null ? const _Phase() : spec.phaseForWeek(w);

    final builtSessions =
        sessions.map((s) => _buildSession(s, w, library, phase)).toList();
    weeks.add(
      ProgramWeekIsar(weekId: '${spec.programId}_w$w', weekNumber: w)
        ..sessions = builtSessions,
    );
  }
  return ProgramIsar(programId: spec.programId, name: spec.name)..weeks = weeks;
}

ProgramSessionIsar _buildSession(
  _SessionSpec spec,
  int week,
  Map<String, ExerciseIsar> library,
  _Phase phase,
) {
  final exercises = spec.exercises
      .map((e) => _buildExercise(e, week, library, phase))
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
  _Phase phase,
) {
  final ex = library[spec.exId];

  final rawWeight = spec.baseWeight == 0
      ? 0.0
      : spec.baseWeight + spec.progression * (week - 1);
  final weight = rawWeight == 0 ? 0.0 : _roundToHalf(rawWeight * phase.weightMultiplier);

  final sets = (spec.sets + phase.setDelta).clamp(1, 10);
  final minRep = (spec.minRep + phase.repShift).clamp(1, 60);
  final maxRep = (spec.maxRep + phase.repShift).clamp(minRep, 60);

  final planSets = List.generate(
    sets,
    (_) => PlannedSetIsar(estWeight: weight, minRep: minRep, maxRep: maxRep),
  );
  return PlannedExerciseIsar(
    exId: spec.exId,
    exerciseName: ex?.name ?? spec.exId,
    equipment: ex?.equipment ?? 'Barbell',
    imagePath: ex?.imagePath ?? 'assets/images/workouticon.png',
    notes: '',
  )..sets = planSets;
}

double _roundToHalf(double value) => (value / 2.5).round() * 2.5;

// ---------------------------------------------------------------------------
// Program definitions (weekly template; rest days are any day 1..7 with no
// session). estWeight is a week-1 starting weight that progresses weekly per
// exercise. A [_Phase] can reshape weight/sets/reps for whole weeks (a
// deload, an intensity block, a PR test) without redefining the exercises.
// ---------------------------------------------------------------------------

class _ExSpec {
  final String exId;
  final int sets;
  final int minRep;
  final int maxRep;
  final double baseWeight;

  /// kg added per week. Only applied when [baseWeight] is non-zero — bodyweight
  /// and cable/machine accessories with no baseWeight stay at "0" (the lifter
  /// fills in the actual number while logging) and never auto-progress.
  final double progression;

  const _ExSpec(
    this.exId,
    this.sets,
    this.minRep,
    this.maxRep, [
    this.baseWeight = 0,
    this.progression = _weeklyProgression,
  ]);
}

class _SessionSpec {
  final String name;
  final int day;
  final List<_ExSpec> exercises;
  const _SessionSpec(this.name, this.day, this.exercises);
}

/// A whole-week adjustment applied on top of the normal exercise numbers:
/// heavier/lighter (deload, intensity, test), and fewer/more sets or reps.
class _Phase {
  final double weightMultiplier;
  final int setDelta;
  final int repShift;
  const _Phase({this.weightMultiplier = 1.0, this.setDelta = 0, this.repShift = 0});
}

_Phase _neutralPhase(int week) => const _Phase();

class _ProgramSpec {
  final String programId;
  final String name;
  final int weeks;
  final List<_SessionSpec> sessions;
  final _Phase Function(int week) phaseForWeek;

  /// Full replacement session list for specific weeks (a deload, a mock
  /// meet…) where the week isn't just "the usual template, adjusted" but a
  /// genuinely different day-by-day plan.
  final Map<int, List<_SessionSpec>> weekOverrides;

  _ProgramSpec(
    this.programId,
    this.name,
    this.weeks,
    this.sessions, {
    _Phase Function(int week)? phaseForWeek,
    this.weekOverrides = const {},
  }) : phaseForWeek = phaseForWeek ?? _neutralPhase;
}

// ---------------------------------------------------------------------------
// Forge Strength's periodization: 3 weeks building volume, a deload to
// absorb the fatigue, 3 weeks of heavier/lower-rep intensity work restarting
// from week 5, then a week-8 test of the new working max.
// ---------------------------------------------------------------------------
_Phase _forgeStrengthPhase(int week) {
  if (week <= 3) return const _Phase(); // Weeks 1-3: volume baseline
  if (week == 4) {
    return const _Phase(weightMultiplier: 0.75, setDelta: -1); // Week 4: deload
  }
  if (week <= 7) {
    return const _Phase(weightMultiplier: 1.08, repShift: -2); // Weeks 5-7: intensity
  }
  return const _Phase(
    weightMultiplier: 1.15,
    repShift: -4,
    setDelta: -2,
  ); // Week 8: test a new PR
}

final List<_ProgramSpec> _programs = <_ProgramSpec>[
  // ---------------------------------------------------------------------
  // 1. Forge Linear — Beginner, 8 weeks, 3 days/week (Mon/Wed/Fri).
  // Straight linear progression: squat/bench +2.5kg per week, deadlift
  // +5kg per week. Every session ends with core work.
  // ---------------------------------------------------------------------
  _ProgramSpec('forge_linear', 'Forge Linear (Beginner)', 8, [
    _SessionSpec('Full Body A', 1, [
      _ExSpec('squat', 3, 5, 5, 60, 2.5),
      _ExSpec('bench_press', 3, 5, 5, 40, 2.5),
      _ExSpec('lat_pulldown', 3, 10, 12, 45, 1.0),
      _ExSpec('romanian_deadlift', 3, 8, 10, 50, 1.5),
      _ExSpec('plank', 3, 30, 60),
    ]),
    _SessionSpec('Full Body B', 3, [
      _ExSpec('bench_press', 3, 5, 5, 40, 2.5),
      _ExSpec('front_squat', 3, 8, 8, 45, 1.5),
      _ExSpec('seated_cable_row', 3, 10, 12, 45, 1.0),
      _ExSpec('overhead_press', 3, 8, 10, 30, 1.25),
      _ExSpec('hanging_leg_raise', 3, 10, 15),
    ]),
    _SessionSpec('Full Body C', 5, [
      _ExSpec('deadlift', 3, 5, 5, 80, 5.0),
      _ExSpec('pause_bench_press', 3, 5, 5, 35, 2.0),
      _ExSpec('bulgarian_split_squat', 3, 8, 10, 16, 1.0),
      _ExSpec('face_pull', 3, 12, 15, 15, 0.5),
      _ExSpec('cable_crunch', 3, 12, 15),
    ]),
  ]),

  // ---------------------------------------------------------------------
  // 2. Forge Strength — Intermediate, 8 weeks, 4 days/week. Bench and squat
  // are each hit twice; deadlift once heavy, once fast. See
  // [_forgeStrengthPhase] for the volume -> deload -> intensity -> test
  // periodization applied on top of these numbers.
  // ---------------------------------------------------------------------
  _ProgramSpec(
    'forge_strength',
    'Forge Strength (Intermediate)',
    8,
    [
      _SessionSpec('Squat Day', 1, [
        _ExSpec('squat', 4, 5, 5, 85, 2.5),
        _ExSpec('bench_press', 3, 8, 8, 50, 2.0),
        _ExSpec('barbell_row', 3, 8, 10, 55, 2.0),
        _ExSpec('leg_curl', 3, 10, 12, 30, 1.0),
        _ExSpec('plank', 3, 45, 60),
      ]),
      _SessionSpec('Bench Day', 2, [
        _ExSpec('bench_press', 4, 5, 5, 60, 2.5),
        _ExSpec('overhead_press', 3, 8, 10, 35, 1.25),
        _ExSpec('lat_pulldown', 3, 10, 12, 55, 1.0),
        _ExSpec('barbell_curl', 3, 10, 12, 22, 0.5),
        _ExSpec('tricep_pushdown', 3, 10, 12, 28, 0.5),
      ]),
      _SessionSpec('Deadlift Day', 4, [
        _ExSpec('deadlift', 4, 4, 4, 105, 5.0),
        _ExSpec('pause_squat', 3, 5, 5, 65, 2.0),
        _ExSpec('incline_bench_press', 3, 8, 10, 42, 1.5),
        _ExSpec('rear_delt_fly', 3, 12, 15, 8),
        _ExSpec('cable_crunch', 3, 15, 15),
      ]),
      _SessionSpec('Speed Day', 5, [
        _ExSpec('bench_press', 6, 3, 3, 42, 1.25),
        _ExSpec('romanian_deadlift', 3, 8, 10, 62, 1.5),
        _ExSpec('hack_squat', 3, 10, 12, 70, 1.5),
        _ExSpec('chest_fly', 3, 12, 15, 12),
        _ExSpec('face_pull', 3, 15, 15, 15),
      ]),
    ],
    phaseForWeek: _forgeStrengthPhase,
  ),

  // ---------------------------------------------------------------------
  // 3. Forge Peak — Advanced, 6 weeks, peaking for a mock meet. Six named
  // days a week (the Wednesday "recovery" session is light cardio/mobility,
  // not a lifting day). Week 6 replaces the whole week with a mock-meet
  // single on each competition lift.
  // ---------------------------------------------------------------------
  _ProgramSpec(
    'forge_peak',
    'Forge Peak (Advanced)',
    6,
    [
      _SessionSpec('Heavy Squat', 1, [
        _ExSpec('squat', 5, 3, 3, 110, 2.5),
        _ExSpec('pause_squat', 3, 5, 5, 75, 2.0),
        _ExSpec('leg_press', 3, 10, 10, 140, 3.0),
        _ExSpec('plank', 3, 45, 60),
      ]),
      _SessionSpec('Heavy Bench', 2, [
        _ExSpec('bench_press', 5, 3, 3, 75, 2.5),
        _ExSpec('spoto_press', 3, 5, 5, 55, 1.5),
        _ExSpec('barbell_row', 3, 8, 8, 60, 1.5),
        _ExSpec('rear_delt_fly', 3, 12, 15, 8),
      ]),
      _SessionSpec('Recovery', 3, [
        _ExSpec('treadmill_run', 1, 15, 20),
        _ExSpec('plank', 2, 30, 45),
      ]),
      _SessionSpec('Heavy Deadlift', 4, [
        _ExSpec('deadlift', 5, 2, 2, 130, 5.0),
        _ExSpec('deficit_deadlift', 3, 5, 5, 95, 2.5),
        _ExSpec('leg_curl', 3, 10, 10, 35, 1.0),
        _ExSpec('cable_crunch', 3, 15, 15),
      ]),
      _SessionSpec('Competition Bench', 5, [
        _ExSpec('bench_press', 5, 2, 2, 80, 2.5),
        _ExSpec('close_grip_bench_press', 3, 6, 6, 55, 1.5),
        _ExSpec('pull_up', 3, 8, 10),
        _ExSpec('overhead_press', 3, 8, 8, 38, 1.0),
      ]),
      _SessionSpec('Technique Day', 6, [
        _ExSpec('squat', 6, 2, 2, 70, 1.5),
        _ExSpec('bench_press', 6, 3, 3, 50, 1.5),
        _ExSpec('deadlift', 5, 2, 2, 85, 2.0),
        _ExSpec('face_pull', 3, 15, 15, 15),
      ]),
    ],
    weekOverrides: {
      6: [
        _SessionSpec('Mock Meet — Squat', 1, [
          _ExSpec('squat', 3, 1, 1, 125),
        ]),
        _SessionSpec('Mock Meet — Bench', 2, [
          _ExSpec('bench_press', 3, 1, 1, 92.5),
        ]),
        _SessionSpec('Mock Meet — Deadlift', 4, [
          _ExSpec('deadlift', 3, 1, 1, 150),
        ]),
      ],
    },
  ),

  // ---------------------------------------------------------------------
  // 4. Forge Mass — Beginner-Intermediate powerbuilding, 8 weeks, 4-day
  // upper/lower split. Main lifts 4-6 reps, accessories 8-15.
  // ---------------------------------------------------------------------
  _ProgramSpec('forge_mass', 'Forge Mass (Powerbuilding)', 8, [
    _SessionSpec('Upper A', 1, [
      _ExSpec('bench_press', 4, 5, 5, 55, 2.5),
      _ExSpec('incline_dumbbell_press', 3, 8, 10, 22, 1.0),
      _ExSpec('machine_chest_press', 3, 10, 12, 40, 1.0),
      _ExSpec('barbell_row', 3, 8, 10, 50, 1.5),
      _ExSpec('lat_pulldown', 3, 10, 12, 50, 1.0),
      _ExSpec('dumbbell_shoulder_press', 3, 8, 10, 18, 1.0),
      _ExSpec('tricep_pushdown', 3, 10, 15, 25, 0.5),
    ]),
    _SessionSpec('Lower A', 2, [
      _ExSpec('squat', 4, 5, 5, 75, 2.5),
      _ExSpec('leg_press', 3, 10, 12, 120, 2.5),
      _ExSpec('romanian_deadlift', 3, 8, 10, 60, 1.5),
      _ExSpec('leg_curl', 3, 10, 15, 30, 1.0),
      _ExSpec('calf_raise', 3, 12, 15, 45, 1.0),
      _ExSpec('cable_crunch', 3, 15, 15),
    ]),
    _SessionSpec('Upper B', 4, [
      _ExSpec('overhead_press', 4, 5, 5, 32, 1.5),
      _ExSpec('weighted_pull_up', 3, 6, 8, 5, 1.0),
      _ExSpec('chest_fly', 3, 12, 15, 12, 0.5),
      _ExSpec('seated_cable_row', 3, 10, 12, 50, 1.0),
      _ExSpec('barbell_curl', 3, 10, 15, 20, 0.5),
      _ExSpec('rear_delt_fly', 3, 12, 15, 8),
    ]),
    _SessionSpec('Lower B', 5, [
      _ExSpec('deadlift', 4, 5, 5, 90, 5.0),
      _ExSpec('hack_squat', 3, 10, 12, 70, 1.5),
      _ExSpec('walking_lunge', 3, 12, 12, 16, 1.0),
      _ExSpec('hip_thrust', 3, 10, 12, 60, 1.5),
      _ExSpec('leg_extension', 3, 12, 15, 35, 1.0),
      _ExSpec('calf_raise', 3, 12, 15, 45, 1.0),
    ]),
  ]),

  // ---------------------------------------------------------------------
  // 5. Forge Elite Hybrid — Intermediate-Advanced powerbuilding, 8 weeks,
  // 5 days: one heavy SBD day each, a dedicated arms/shoulders day, and a
  // Friday volume day tying SBD back together.
  // ---------------------------------------------------------------------
  _ProgramSpec('forge_elite_hybrid', 'Forge Elite Hybrid (Powerbuilding)', 8, [
    _SessionSpec('Heavy Squat', 1, [
      _ExSpec('squat', 5, 4, 4, 100, 2.5),
      _ExSpec('hack_squat', 3, 10, 10, 80, 2.0),
      _ExSpec('leg_extension', 3, 12, 15, 40, 1.0),
      _ExSpec('calf_raise', 3, 12, 15, 50, 1.0),
    ]),
    _SessionSpec('Heavy Bench', 2, [
      _ExSpec('bench_press', 5, 4, 4, 70, 2.5),
      _ExSpec('incline_bench_press', 3, 8, 10, 45, 1.5),
      _ExSpec('chest_fly', 3, 12, 15, 14, 0.5),
      _ExSpec('tricep_pushdown', 3, 10, 15, 28, 0.5),
    ]),
    _SessionSpec('Heavy Deadlift', 3, [
      _ExSpec('deadlift', 5, 3, 3, 120, 5.0),
      _ExSpec('barbell_row', 3, 8, 10, 60, 2.0),
      _ExSpec('lat_pulldown', 3, 10, 12, 55, 1.0),
      _ExSpec('rear_delt_fly', 3, 12, 15, 8),
    ]),
    _SessionSpec('Shoulders & Arms', 4, [
      _ExSpec('overhead_press', 4, 6, 8, 38, 1.5),
      _ExSpec('lateral_raise', 3, 12, 15, 8, 0.5),
      _ExSpec('rear_delt_fly', 3, 12, 15, 8),
      _ExSpec('ez_bar_curl', 3, 10, 12, 18, 0.5),
      _ExSpec('hammer_curl', 3, 10, 12, 14, 0.5),
      _ExSpec('skull_crusher', 3, 10, 12, 18, 0.5),
      _ExSpec('rope_pushdown', 3, 12, 15, 25, 0.5),
    ]),
    _SessionSpec('Volume SBD', 5, [
      _ExSpec('pause_squat', 3, 6, 6, 80, 2.0),
      _ExSpec('spoto_press', 3, 6, 6, 55, 1.5),
      _ExSpec('romanian_deadlift', 3, 8, 10, 65, 1.5),
      _ExSpec('cable_crunch', 3, 15, 15),
      _ExSpec('rowing_machine', 1, 15, 20),
    ]),
  ]),
];
