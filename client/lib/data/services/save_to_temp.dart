import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:client/data/model_temp/temp_planned_exercise.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/services/database_service.dart';
import 'package:client/data/services/planned_session_service.dart';
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

  void addPlannedExerciseNotes(int index, String note) {
    ref.read(tempSessionProvider.notifier).addNotesToExercise(index, note);
  }

  void convertToTemp(int id) async {
    final sessionService = PlannedSessionService();

    final session = await sessionService.getSessionById(id);
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

          if (w.notes != null) {
            addPlannedExerciseNotes(i, w.notes!);
          }
          print("EXERCISE NAME");
          print("EX ID${w.exId}");
          if (w.exId != null) {
            final exercise = await DatabaseService.db.exercises
                .filter()
                .exIdEqualTo(w.exId!)
                .findFirst();
            final plannedExercise = TempPlannedExercise(exercise: exercise);

            addExercise(plannedExercise);
          }
        }
      }
    }
  }
}
