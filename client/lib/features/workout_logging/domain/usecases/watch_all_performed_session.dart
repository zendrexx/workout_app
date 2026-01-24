import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:client/features/workout_logging/domain/repositories/performed_workout_repository.dart';

class WatchAllPerformedSession {
  final PerformedWorkoutRepository repo;

  WatchAllPerformedSession(this.repo);

  Stream<List<PerformedSession>> call() {
    return repo.watchAllPerformedSession();
  }
}
