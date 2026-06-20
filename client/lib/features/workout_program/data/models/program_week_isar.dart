import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/features/workout_program/data/models/program_isar.dart';
import 'package:isar/isar.dart';

part 'program_week_isar.g.dart';

@embedded
class ProgramWeekIsar {
  String weekId = "";

  int weekNumber = 0;

  List<String> sessionIds = [];

  ProgramWeekIsar({this.weekId = "", this.weekNumber = 0});
}
