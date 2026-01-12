import 'package:client/features/workout_planning/data/models/exercise_isar.dart';
import 'package:client/features/workout_planning/domain/entities/exercise.dart';

Exercise toDomainExercise(ExerciseIsar e) {
  final ex = Exercise(
    exId: e.exId,
    name: e.name,
    primMuscle: e.primMuscle,
    imagePath: e.imagePath,
    equipment: e.equipment,
    seconMuscle: e.seconMuscle,
  );
  return ex;
}
