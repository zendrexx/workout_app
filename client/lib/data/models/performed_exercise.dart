import 'package:client/data/models/performed_session.dart';
import 'package:client/data/models/performed_sets.dart';
import 'package:isar/isar.dart';

part 'performed_exercise.g.dart';

@collection
class PerformedExercise {
  Id id = Isar.autoIncrement;
  String name;
  double? volume; // total per exercise
  String? notes;
  final workoutSession = IsarLink<PerformedSession>();
  final workoutSets = IsarLinks<Workoutsets>();

  PerformedExercise({required this.name});
}
