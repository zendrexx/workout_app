import 'package:client/data/models/performed_exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:isar/isar.dart';

part 'performed_session.g.dart';

@collection
class PerformedSession {
  Id id = Isar.autoIncrement;
  final baseSession = IsarLink<PlannedSession>(); // which plan was followed

  DateTime startTime = DateTime.now();
  DateTime? endTime;
  double? totalVolume; // sum of (weight × reps)
  bool isCompleted = false;

  // you could also snapshot the performed exercises separately if needed
  final performedExercises = IsarLinks<PerformedExercise>();

  PerformedSession();
}
