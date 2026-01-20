import 'package:client/data/models/performed_exercise.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/data/models/workout_stats.dart';
import 'package:isar/isar.dart';

part 'performed_session.g.dart';

@collection
class PerformedSession {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String performedSessionId = "";

  String? name;
  DateTime createdAt = DateTime.now();
  DateTime? endTime;

  bool isCompleted = false;
  final workoutStats = IsarLinks<WorkoutStats>();

  final performedExercises = IsarLinks<PerformedExercise>();

  PerformedSession();
}
