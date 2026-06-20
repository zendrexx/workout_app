import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:isar/isar.dart';

class PlannedWorkoutIsarDatasource {
  final Isar isar;
  PlannedWorkoutIsarDatasource(this.isar);

  Future<void> addSession({required PlannedSessionIsar session}) async {
    await isar.writeTxn(() async {
      await isar.plannedSessionIsars.put(session);
    });
  }

  Stream<List<PlannedSessionIsar>> watchAll() {
    return isar.plannedSessionIsars.where().watch(fireImmediately: true);
  }

  Future<void> deleteSession(String sessionId) async {
    await isar.writeTxn(() async {
      final session = await isar.plannedSessionIsars.getBySessionId(sessionId);
      if (session != null) {
        await isar.plannedSessionIsars.delete(session.id);
      }
      // await isar.plannedSessionIsars.clear();
    });
  }

  Future<PlannedSessionIsar?> duplicateSession(String sessionId) async {
    final original = await isar.plannedSessionIsars.getBySessionId(sessionId);

    if (original == null) return null;

    late PlannedSessionIsar copy;

    await isar.writeTxn(() async {
      copy = PlannedSessionIsar(
        sessionId: IdGenerator().getId(),
        name: "Copy of ${original.name}",
        createdAt: DateTime.now(),
        dayNumber: original.dayNumber,
      );

      copy.exercises = original.exercises.map((exercise) {
        return PlannedExerciseIsar(
            exId: IdGenerator().getId(),
            exerciseName: exercise.exerciseName,
            imagePath: exercise.imagePath,
            equipment: exercise.equipment,
            notes: exercise.notes,
          )
          ..sets = exercise.sets.map((set) {
            return PlannedSetIsar(
              estWeight: set.estWeight,
              minRep: set.minRep,
              maxRep: set.maxRep,
            );
          }).toList();
      }).toList();

      await isar.plannedSessionIsars.put(copy);
    });

    return copy;
  }

  Future<PlannedSessionIsar?> getSessionById(String sessionId) async {
    return await isar.plannedSessionIsars.getBySessionId(sessionId);
  }

  Future<List<ExerciseIsar>> getAllExercies() async {
    final db = isar;
    final exercises = db.exerciseIsars.where().findAll();
    return exercises;
  }
}
