import 'package:client/features/home/session/planning/viewmodel/temp_session_notifier.dart';
import 'package:client/data/model_temp/temp_planned_exercise.dart';
import 'package:client/data/model_temp/temp_planned_sets.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/features/workout_planning/data/models/planned_exercise_isar.dart';
import 'package:client/features/workout_planning/data/models/planned_session_isar.dart';
import 'package:client/core/database/database_service.dart';
import 'package:client/data/repositories/planned_session_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class SaveToTemp {
  final WidgetRef ref;

  const SaveToTemp({required this.ref});

  void addName(String title) {
    ref.read(tempSessionProvider.notifier).addTitle(title);
  }

  void addExercise(TempPlannedExercise exercise) {
    ref.read(tempSessionProvider.notifier).addExercise(exercise);
  }

  void addId(int sessionId) {
    ref.read(tempSessionProvider.notifier).addSessionId(sessionId);
  }

  void addPlannedExerciseNotes(int index, String note) {
    ref.read(tempSessionProvider.notifier).addNotesToExercise(index, note);
  }

  void addPlannedExerciseSets(int index, TempPlannedSets sets) {
    ref.read(tempSessionProvider.notifier).addSetToExercise(index, sets);
  }

  void convertToTemp(int id) async {
    final sessionService = PlannedSessionService();

    final session = await sessionService.getSessionById(id);
    addId(id);
    if (session != null) {
      if (session.name != null) {
        addName(session.name!);
      }
      await session.plannedExercise.load();

      final workouts = session.plannedExercise;
      if (workouts != null) {
        final list = workouts.toList();

        for (int i = 0; i < list.length; i++) {
          final w = list[i];
          if (w.exId != null) {
            final exercise = await DatabaseService.db.exercises
                .filter()
                .exIdEqualTo(w.exId!)
                .findFirst();
            final plannedExercise = TempPlannedExercise(exercise: exercise);

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
            TempPlannedSets plannedsets = TempPlannedSets()
              ..estWeight = s.estWeight
              ..minRep = s.minRep
              ..maxRep = s.maxRep;
            addPlannedExerciseSets(i, plannedsets);
          }
        }
      }
    }
  }
}
