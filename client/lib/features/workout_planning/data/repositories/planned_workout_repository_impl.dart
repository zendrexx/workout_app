import 'package:client/data/data_source/planned_workout_data_source.dart';
import 'package:client/features/workout_planning/data/datasources/planned_workout_isar_datasource.dart';
import 'package:client/features/workout_planning/data/mappers/planned_workout_mapper.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
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
  Future<List<PlannedSessionIsar>> getAllPlannedSession() async {
    final isarSessions = await datasource.getAllPlannedSession();
    return isarSessions;
  }
}
