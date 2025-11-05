import 'package:client/data/models/performed_session.dart';
import 'package:client/data/models/performed_sets.dart';
import 'package:isar/isar.dart';

part 'performed_exercise.g.dart';

@collection
class PerformedExercise {
  Id id = Isar.autoIncrement;
  String? exerciseName;
  String? exercisePath;
  String? equipment;
  String? exId;
  String? notes;

  var sets = IsarLinks<PlannedSet>();

  var session = IsarLink<PlannedSession>();

  PerformedExercise({required this.name});
}
