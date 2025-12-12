import 'package:client/data/models/performed_exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/models/workout_stats.dart';
import 'package:isar/isar.dart';

part 'performed_session.g.dart';

@collection
class PerformedSession {
  Id id = Isar.autoIncrement;
  String? name;
  DateTime createdAt = DateTime.now();
  DateTime? endTime;
  double? totalVolume; // sum of (weight × reps)
  bool isCompleted = false;
  final workoutStats = IsarLinks<WorkoutStats>();
  // you could also snapshot the performed exercises separately if needed
  final performedExercises = IsarLinks<PerformedExercise>();

  PerformedSession();
}
