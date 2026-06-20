// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_logging/data/models/performed_sets_isar.dart';
import 'package:isar/isar.dart';

import 'package:client/features/workout_logging/data/models/performed_exercise_isar.dart';
import 'package:client/features/workout_logging/data/models/performed_stats_isar.dart';

part 'performed_session_isar.g.dart';

@collection
class PerformedSessionIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String performedSessionId = "";

  String name = "";

  DateTime endTime;

  String plannedSessionId = "";

  List<PerformedExerciseIsar> performedExercises = [];
  PerformedStatsIsar performedStats;
  PerformedSessionIsar({
    required this.performedSessionId,
    required this.name,
    required this.endTime,
    required this.plannedSessionId,
    required this.performedExercises,
    required this.performedStats,
  });
}
