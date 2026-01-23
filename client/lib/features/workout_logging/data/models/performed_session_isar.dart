// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

import 'package:client/features/workout_logging/data/models/performed_exercise_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_stats_isar.dart';

part 'performed_session_isar.g.dart';

@collection
class PerformedSessionIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String performedSessionId;

  late String name;

  late DateTime endTime;

  bool isCompleted = false;
  final workoutStats = IsarLink<PerformedStatsIsar>();

  final performedExercises = IsarLinks<PerformedExerciseIsar>();
}
