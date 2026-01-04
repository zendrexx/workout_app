import 'package:client/data/models/exercise.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/core/database/database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plannedSetStreamProvider = StreamProvider.family<List<PlannedSet>, int>((
  ref,
  exerciseId,
) async* {
  final isar = DatabaseService.db;
  yield* isar.plannedExercises
      .watchObject(exerciseId, fireImmediately: true)
      .asyncMap((plannedExercises) async {
        if (plannedExercises == null) return [];
        await plannedExercises.sets.load();
        return plannedExercises.sets.toList();
      });
});
