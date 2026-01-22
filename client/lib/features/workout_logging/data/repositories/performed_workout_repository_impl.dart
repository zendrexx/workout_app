import 'package:client/features/workout_logging/data/datasources/performed_workout_isar_datasource.dart';
import 'package:client/features/workout_logging/domain/entities/workout_logging.dart';
import 'package:client/features/workout_logging/domain/repositories/performed_workout_repository.dart';

class PerformedWorkoutRepositoryImpl implements PerformedWorkoutRepository {
  final PerformedWorkoutIsarDatasource datasource;
  PerformedWorkoutRepositoryImpl(this.datasource);
  @override
  Future<void> addPerformedSession(WorkoutLogging plannedSession) {
    // TODO: implement addPerformedSession
    throw UnimplementedError();
  }

  @override
  Future<WorkoutLogging?> getPerformedSessionById(String sessionId) {
    // TODO: implement getPerformedSessionById
    throw UnimplementedError();
  }

  @override
  Stream<List<WorkoutLogging>> watchAllPerformedSession() {
    // TODO: implement watchAllPerformedSession
    throw UnimplementedError();
  }
}
