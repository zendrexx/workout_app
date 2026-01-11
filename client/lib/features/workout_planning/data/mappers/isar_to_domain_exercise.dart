import 'package:client/data/models/exercise_isar.dart';
import 'package:client/features/workout_planning/domain/entities/exercise.dart';

Exercise toDomainExercise(ExerciseIsar s) {
  final ex = Exercise(exId: s.exId, name: s.name, primMuscle: s.primMuscle);
  return ex;
}
