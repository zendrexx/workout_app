import 'package:client/core/notifier/temp_performed_session_notifier%20copy.dart';
import 'package:client/data/model_temp/temp_performed_exercise.dart';
import 'package:client/data/model_temp/temp_performed_sets.dart';
import 'package:client/data/model_temp/temp_planned_exercise.dart';
import 'package:client/data/model_temp/temp_planned_sets.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/services/database_service.dart';
import 'package:client/data/services/performed_session_service.dart';
import 'package:client/data/services/planned_session_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class SaveToPerformedTemp {
  final WidgetRef ref;
  const SaveToPerformedTemp({required this.ref});

  void addName(String title) {
    ref.read(tempPerformedSessionProvider.notifier).addTitle(title);
  }

  void addExercise(TempPerformedExercise exercise) {
    ref.read(tempPerformedSessionProvider.notifier).addExercise(exercise);
  }

  void addId(int sessionId) {
    ref.read(tempPerformedSessionProvider.notifier).addSessionId(sessionId);
  }

  void addPlannedExerciseNotes(int index, String note) {
    ref
        .read(tempPerformedSessionProvider.notifier)
        .addNotesToExercise(index, note);
  }

  void addPlannedExerciseSets(int index, TempPerformedSets sets) {
    ref
        .read(tempPerformedSessionProvider.notifier)
        .addSetToExercise(index, sets);
  }

  void convertToTemp(int id) async {
    final sessionService = PerformedSessionService();

    final session = await sessionService.getSessionById(id);
    addId(id);
    if (session != null) {
      if (session.name != null) {
        addName(session.name!);
      }
      await session.performedExercises.load();

      final workouts = session.performedExercises;
      if (workouts != null) {
        final list = workouts.toList();

        for (int i = 0; i < list.length; i++) {
          final w = list[i];
          if (w.exId != null) {
            final exercise = await DatabaseService.db.exercises
                .filter()
                .exIdEqualTo(w.exId!)
                .findFirst();
            final plannedExercise = TempPerformedExercise(exercise: exercise);

            addExercise(plannedExercise);
          }
          if (w.notes != null) {
            addPlannedExerciseNotes(i, w.notes!);
          }
          print("EXERCISE NAME");
          print("EX ID${w.exId}");

          await w.sets.load();
          final sets = w.sets;

          final setList = sets.toList();
          for (int j = 0; j < setList.length; j++) {
            final s = setList[j];
            TempPerformedSets plannedsets = TempPerformedSets()
              ..actWeight = s.estWeight
              ..actRep = s.minRep
              ..isDone = s.maxRep
              ..prevWeight = s.prev;
            addPlannedExerciseSets(i, plannedsets);
          }
        }
      }
    }
  }
}
