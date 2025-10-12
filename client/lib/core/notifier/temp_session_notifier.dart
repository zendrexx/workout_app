import 'package:client/data/model_temp/temp_session.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/models/planned_set.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final tempSessionProvider =
    StateNotifierProvider<TempSessionNotifier, TempSession>(
      (ref) => TempSessionNotifier(),
    );

class TempSessionNotifier extends StateNotifier<TempSession> {
  TempSessionNotifier() : super(TempSession(name: "", isCompleted: false));
  void updateName(String newName) {
    state = state.copyWith(name: newName);
  }

  void addExercise(Exercise exercise) {
    final updatedExercises = [...state.exercises, exercise];
    state = state.copyWith(exercises: updatedExercises);
  }

  void deleteExercise(int index) {
    final updatedExercises = [...state.exercises];
    updatedExercises.removeAt(index);
    state = state.copyWith(exercises: updatedExercises);
  }

  void updateExerciseAt(int index, Exercise updatedExercise) {
    final updatedExercises = [...state.exercises];
    if (index >= 0 && index < updatedExercises.length) {
      updatedExercises[index] = updatedExercise;
      state = state.copyWith(exercises: updatedExercises);
    }
  }

  void addSetToExercise() {}
}
