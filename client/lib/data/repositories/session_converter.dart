import 'package:client/data/model_temp/temp_session.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/repositories/exercise_converter.dart';

extension TempSessionMapper on TempSession {
  PlannedSession toPlannedSession() {
    return PlannedSession(
      name: name,
      exercises: plannedExercise
          .map((tempExercise) => tempExercise.toPlannedExercise())
          .toList(),
    );
  }
}
