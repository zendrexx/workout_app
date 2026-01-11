import 'package:client/features/workout_planning/data/datasources/planned_workout_isar_datasource.dart';
import 'package:client/features/workout_planning/data/mappers/domain_to_isar_session_mapper.dart';
import 'package:client/features/workout_planning/data/mappers/isar_to_domain_exercise.dart';
import 'package:client/features/workout_planning/data/mappers/isar_to_domain_session_mapper.dart';
import 'package:client/features/workout_planning/domain/entities/exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';

class PlannedWorkoutRepositoryImpl implements PlannedWorkoutSessionRepository {
  final PlannedWorkoutIsarDatasource datasource;
  PlannedWorkoutRepositoryImpl(this.datasource);

  @override
  Future<void> addSession(PlannedWorkoutSession plannedSession) {
    final isarSession = toIsarSession(plannedSession);
    return datasource.addSession(isarSession);
  }

  @override
  Future<List<PlannedWorkoutSession>> getAllPlannedSession() async {
    final isarSessions = await datasource.getAllPlannedSession();
    if (isarSessions.isEmpty) return [];
    return isarSessions.map((s) => toDomainSession(s)).toList();
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
