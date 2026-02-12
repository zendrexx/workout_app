import 'package:client/features/workout_logging/data/datasources/performed_workout_isar_datasource.dart';
import 'package:client/features/workout_logging/data/mappers/isar_to_domain_performed_session_mapper.dart';
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
        await s.performedExercises.load();

        for (final ex in s.performedExercises) {
          await ex.sets.load();
        }

        await s.performedStats.load();
      }

      return sessions.map(toDomainPerformedSession).toList();
    });
  }
}
