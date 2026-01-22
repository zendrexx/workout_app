import 'package:client/features/workout_logging/data/models/performed_exercise_isar.dart';
import 'package:client/features/workout_logging/data/models/workout_stats_isar.dart';
import 'package:isar/isar.dart';

part 'performed_session_isar.g.dart';

@collection
class PerformedSessionIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String performedSessionId = "";

  String? name;

  DateTime? endTime;

  bool isCompleted = false;
  final workoutStats = IsarLink<WorkoutStatsIsar>();

  final performedExercises = IsarLinks<PerformedExerciseIsar>();

  PerformedSessionIsar();
}
