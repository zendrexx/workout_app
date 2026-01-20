import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/data/models/workout_stats.dart';
import 'package:isar/isar.dart';

part 'planned_session_isar.g.dart';

@Collection()
class PlannedSessionIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String sessionId = "";

  late String? name;
  DateTime createdAt = DateTime.now();

  final plannedExercise = IsarLinks<PlannedExerciseIsar>();
  PlannedSessionIsar({this.name, exercises});
}
