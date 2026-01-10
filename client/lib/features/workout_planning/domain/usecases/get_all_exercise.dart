import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';

class GetAllExercise {
  final PlannedWorkoutSessionRepository repo;

  GetAllExercise(this.repo);

  Future<void> call() {
    return repo.getAllExercies();
  }
}
