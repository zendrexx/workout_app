import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_program/data/models/program_week_isar.dart';
import 'package:isar/isar.dart';

part 'planned_session_isar.g.dart';

@Collection()
class PlannedSessionIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String sessionId = "";

  late String name;
  //DateTime createdAt;
  late int dayNumber;
  final plannedExercise = IsarLinks<PlannedExerciseIsar>();
  final week = IsarLink<ProgramWeekIsar>();
  PlannedSessionIsar({
    required this.name,

    required this.sessionId,
    //required this.createdAt,
  });
}
