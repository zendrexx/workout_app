import 'package:client/data/models/workout_session.dart';
import 'package:client/data/models/workout_sets.dart';
import 'package:isar/isar.dart';

part 'performed_exercise.g.dart';

@Collection()
class PerformedExercise {
  Id id = Isar.autoIncrement;
  String name;
  double? volume; // total per exercise
  String? notes;
  final workoutSession = IsarLink<WorkoutSession>();
  final workoutSets = IsarLinks<Workoutsets>();

  PerformedExercise({required this.name});
}
