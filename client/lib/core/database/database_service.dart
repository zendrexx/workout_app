import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/data/models/workout_stats.dart';
import 'package:client/data/models/performed_set.dart';
import 'package:client/data/models/performed_exercise.dart';
import 'package:client/data/models/performed_session.dart';
import 'package:client/data/services/exercise_service.dart';

final isarProvider = FutureProvider<Isar>((ref) async {
  final appDir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open([
    PlannedSessionIsarSchema,
    PlannedExerciseIsarSchema,
    PlannedSetIsarSchema,
    ExerciseIsarSchema,
    WorkoutStatsSchema,
    PerformedSetSchema,
    PerformedExerciseSchema,
    PerformedSessionSchema,
  ], directory: appDir.path);

  await seedExercises(isar);

  debugPrint('✅ Isar database opened at: ${appDir.path}');
  return isar;
});
