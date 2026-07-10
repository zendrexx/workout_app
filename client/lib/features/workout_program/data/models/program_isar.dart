import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_set_isar.dart';
import 'package:client/features/workout_program/data/models/program_session_isar.dart';
import 'package:client/features/workout_program/data/models/program_week_isar.dart';
import 'package:isar/isar.dart';

part 'program_isar.g.dart';

@Collection()
class ProgramIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String programId;

  String name;

  List<ProgramWeekIsar> weeks = [];

  ProgramIsar({required this.programId, required this.name});
}
