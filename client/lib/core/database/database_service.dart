import 'package:client/features/profile/data/models/user_profile_isar.dart';
import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:client/features/workout_program/data/models/active_program_isar.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_session_isar.dart';
import 'package:client/data/services/exercise_service.dart';
import 'package:client/data/services/program_service.dart';

final isarProvider = FutureProvider<Isar>((ref) async {
  final appDir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open([
    PlannedSessionIsarSchema,
    ExerciseIsarSchema,
    PerformedSessionIsarSchema,
    ProgramIsarSchema,
    ActiveProgramIsarSchema,
    UserProfileIsarSchema,
  ], directory: appDir.path);

  await seedExercises(isar);
  await seedPrograms(isar);

  debugPrint('✅ Isar database opened at: ${appDir.path}');
  return isar;
});
