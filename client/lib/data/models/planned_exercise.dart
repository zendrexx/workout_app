import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:client/data/models/session.dart';
import 'package:isar/isar.dart';

part 'planned_exercise.g.dart';

@Collection()
class PlannedExercise {
  Id id = Isar.autoIncrement;

  final exercise = IsarLink<Exercise>();

  String? notes;

  final sets = IsarLinks<PlannedSet>();

  final session = IsarLink<Session>();

  PlannedExercise({this.notes});
}
