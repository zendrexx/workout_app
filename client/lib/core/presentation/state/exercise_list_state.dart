// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/core/presentation/state/exercise_state.dart';

class ExerciseListState {
  final bool isLoading;
  final List<ExerciseState> exercises;

  ExerciseListState({required this.exercises, required this.isLoading});

  factory ExerciseListState.initial() {
    return ExerciseListState(isLoading: false, exercises: []);
  }

  ExerciseListState copyWith({
    bool? isLoading,
    List<ExerciseState>? exercises,
  }) {
    return ExerciseListState(
      isLoading: isLoading ?? this.isLoading,
      exercises: exercises ?? this.exercises,
    );
  }
}
