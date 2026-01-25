import 'package:client/features/workout_logging/data/datasources/performed_workout_isar_datasource.dart';
import 'package:client/features/workout_logging/data/mappers/domain_to_isar_performed_session_mapper.dart';
import 'package:client/features/workout_logging/data/mappers/isar_to_domain_performed_session_mapper.dart';
import 'package:client/features/workout_logging/data/models/performed_exercise_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_sets_isar.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:client/features/workout_logging/domain/repositories/performed_workout_repository.dart';

class PerformedWorkoutRepositoryImpl implements PerformedWorkoutRepository {
  final PerformedWorkoutIsarDatasource datasource;
  PerformedWorkoutRepositoryImpl(this.datasource);
  @override
  Future<void> addPerformedSession(PerformedSession plannedSession) {
    return datasource.addPerformedSession(plannedSession);
  }

  @override
  Future<PerformedSession?> getPerformedSessionById(String sessionId) {
    // TODO: implement getPerformedSessionById
    throw UnimplementedError();
  }

  //  @override
  //   Stream<List<PlannedWorkoutSession>> watchAllSessions() {
  //     return datasource.watchAll().map(
  //       (isarSessions) => isarSessions.map(toDomainSession).toList(),
  //     );
  //   }
  @override
  Stream<List<PerformedSession>> watchAllPerformedSession() {
    return datasource.watchAll().asyncMap((sessions) async {
      for (final s in sessions) {
        await s.performedStats.load();
      }

      return sessions.map(toDomainPerformedSession).toList();
    });
  }
}
