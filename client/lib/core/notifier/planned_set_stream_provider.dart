import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:client/data/services/database_service.dart';
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
