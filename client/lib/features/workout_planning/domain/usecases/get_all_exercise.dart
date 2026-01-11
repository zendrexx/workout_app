import 'package:client/features/workout_planning/domain/entities/exercise.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';

class GetAllExercise {
  final PlannedWorkoutSessionRepository repo;

  GetAllExercise(this.repo);

  Future<List<Exercise>> call() {
    return repo.getAllExercises();
  }
}
