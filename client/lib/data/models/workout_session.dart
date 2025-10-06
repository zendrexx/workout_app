import 'package:client/data/models/performed_exercise.dart';
import 'package:client/data/models/session.dart';
import 'package:isar/isar.dart';

part 'workout_session.g.dart';

@Collection()
class WorkoutSession {
  Id id = Isar.autoIncrement;
  final baseSession = IsarLink<Session>(); // which plan was followed

  DateTime startTime = DateTime.now();
  DateTime? endTime;
  double? totalVolume; // sum of (weight × reps)
  bool isCompleted = false;

  // you could also snapshot the performed exercises separately if needed
  final performedExercises = IsarLinks<PerformedExercise>();

  WorkoutSession();
}
