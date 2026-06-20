import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/features/workout_program/data/models/program_week_isar.dart';
import 'package:isar/isar.dart';

part 'planned_session_isar.g.dart';

@Collection()
class PlannedSessionIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String sessionId = "";

  String name = "";
  DateTime createdAt;
  int? dayNumber;
  List<PlannedExerciseIsar> exercises = [];

  PlannedSessionIsar({
    required this.name,
    this.dayNumber,
    required this.sessionId,
    required this.createdAt,
  });
}
