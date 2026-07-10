import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:isar/isar.dart';

part 'program_session_isar.g.dart';

@embedded
class ProgramSessionIsar {
  String sessionId = "";
  String name = "";
  DateTime? createdAt;

  int dayNumber = 0;
  List<PlannedExerciseIsar> exercises = [];
}
