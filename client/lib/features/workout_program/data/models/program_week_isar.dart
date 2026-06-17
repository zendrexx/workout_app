import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:isar/isar.dart';

part 'program_week_isar.g.dart';

@collection
class ProgramWeekIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String weekId;

  late int weekNumber;

  final sessions = IsarLinks<PlannedSessionIsar>();
  final program = IsarLink<ProgramIsar>();
  ProgramWeekIsar({required this.weekId, required this.weekNumber});
}
