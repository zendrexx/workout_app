import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:isar/isar.dart';

part 'planned_session_isar.g.dart';

@Collection()
class PlannedSessionIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String sessionId = "";

  late String name;
  DateTime createdAt;

  final plannedExercise = IsarLinks<PlannedExerciseIsar>();
  PlannedSessionIsar({
    required this.name,

    required this.sessionId,
    required this.createdAt,
  });
}
