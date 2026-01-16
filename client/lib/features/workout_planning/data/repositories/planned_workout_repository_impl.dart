import 'package:client/features/workout_planning/data/datasources/planned_workout_isar_datasource.dart';
import 'package:client/features/workout_planning/data/mappers/domain_to_isar_session_mapper.dart';
import 'package:client/features/workout_planning/data/mappers/isar_to_domain_exercise.dart';
import 'package:client/features/workout_planning/data/mappers/isar_to_domain_session_mapper.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/features/workout_planning/domain/entities/exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';
import 'package:isar/isar.dart';

class PlannedWorkoutRepositoryImpl implements PlannedWorkoutSessionRepository {
  final PlannedWorkoutIsarDatasource datasource;
  PlannedWorkoutRepositoryImpl(this.datasource);

  @override
  Future<void> addSession(PlannedWorkoutSession plannedSession) {
    final isarSession = toIsarSession(plannedSession);

    // Map exercises & sets separately
    final exercises = plannedSession.exercises.map(toIsarExercise).toList();
    final setsMap = <PlannedExerciseIsar, List<PlannedSetIsar>>{
      for (int i = 0; i < exercises.length; i++)
        exercises[i]: plannedSession.exercises[i].sets.map(toIsarSet).toList(),
    };

    return datasource.addSession(
      session: isarSession,
      exercises: exercises,
      setsMap: setsMap,
    );
  }

  @override
  Stream<List<PlannedWorkoutSession>> watchAllSessions() {
    return datasource.watchAll().map(
      (isarSessions) => isarSessions.map(toDomainSession).toList(),
    );
  }

  @override
  Future<void> deleteSession(String sessionId) async {
    return await datasource.deleteSession(sessionId);
  }

  @override
  Future<PlannedSessionIsar?> duplicateSession(String sessionId) async {
    return await datasource.duplicateSession(sessionId);
  }

  @override
  Future<PlannedWorkoutSession?> getSessionById(int id) async {
    final isarSession = await datasource.getSessionById(id);
    if (isarSession == null) return null;
    return toDomainSession(isarSession);
  }

  @override
  Future<List<Exercise>> getAllExercises() async {
    final isarExercises = await datasource.getAllExercies();
    return isarExercises.map((e) => toDomainExercise(e)).toList();
  }
}
