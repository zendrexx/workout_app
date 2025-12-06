import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/workout_stats.dart';
import 'package:isar/isar.dart';

part 'planned_session.g.dart';

@Collection()
class PlannedSession {
  Id id = Isar.autoIncrement;
  late String? name;
  DateTime createdAt = DateTime.now();
  bool isCompleted = false;
  final workoutStats = IsarLinks<WorkoutStats>();

  final plannedExercise = IsarLinks<PlannedExercise>();
  PlannedSession({this.name, exercises});
}
