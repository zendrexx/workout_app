import 'package:client/features/workout_logging/data/models/performed_sets_isar.dart';
import 'package:isar/isar.dart';

part 'performed_exercise_isar.g.dart';

@collection
class PerformedExerciseIsar {
  Id id = Isar.autoIncrement;
  String? exerciseName;
  String? imagePath;
  String? equipment;
  String? exId;
  String? notes;
  var sets = IsarLinks<PerformedSetsIsar>();
}
