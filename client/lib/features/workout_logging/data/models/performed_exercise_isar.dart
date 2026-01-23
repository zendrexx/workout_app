// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

import 'package:client/features/workout_logging/data/models/performed_sets_isar.dart';

part 'performed_exercise_isar.g.dart';

@collection
class PerformedExerciseIsar {
  Id id = Isar.autoIncrement;
  late String exerciseName;
  late String imagePath;
  String? equipment;
  late String exId;
  String? notes;
  final sets = IsarLinks<PerformedSetsIsar>();
}
