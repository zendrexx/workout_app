import 'package:client/data/modelTemp/temp_exercise.dart';
import 'package:client/data/modelTemp/temp_session.dart';
import 'package:client/data/modelTemp/temp_set.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tempSessionProvider =
    StateNotifierProvider<TempSessionNotifier, TempSession>((ref) {
      return TempSessionNotifier();
    });

class TempSessionNotifier extends StateNotifier<TempSession> {
  TempSessionNotifier() : super(TempSession());

  void setSessionName(String name) {
    state = TempSession()
      ..name = name
      ..exercises = state.exercises;
  }

  void addExercise(String name) {
    final updated = [...state.exercises, TempExercise()..name = name];
    state = TempSession()
      ..name = state.name
      ..exercises = updated;
  }

  void addSet(int exerciseIndex, int minReps, int maxReps, double weight) {
    final updatedExercises = [...state.exercises];
    updatedExercises[exerciseIndex].sets.add(
      TempSet(minReps: minReps, maxReps: maxReps, weight: weight),
    );

    state = TempSession()
      ..name = state.name
      ..exercises = updatedExercises;
  }

  void removeExercise(int index) {
    final updated = [...state.exercises]..removeAt(index);
    state = TempSession()
      ..name = state.name
      ..exercises = updated;
  }

  void reset() => state = TempSession();
}
