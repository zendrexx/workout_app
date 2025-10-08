import 'package:client/data/modelTemp/temp_session.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/session.dart';
import 'package:client/data/repositories/planned_session_repository.dart';

extension TempSessionX on TempSession {
  Session toPlannedSession() {
    final session = Session()..name = name;

    for (final tempEx in exercises) {
      final plannedEx = PlannedExercise()..notes = tempEx.notes;
      session.exercises.add(plannedEx);
    }

    return session;
  }
}
