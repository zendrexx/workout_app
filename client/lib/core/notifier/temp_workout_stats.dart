import 'dart:ffi';

import 'package:client/data/model_temp/temp_workout_stats.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tempWorkoutStatsProvider =
    StateNotifierProvider<TempWorkoutStatsNotifier, TempWorkoutStats>(
      (ref) => TempWorkoutStatsNotifier(),
    );

class TempWorkoutStatsNotifier extends StateNotifier<TempWorkoutStats> {
  TempWorkoutStatsNotifier() : super(TempWorkoutStats());

  void addStats(double lbs, int reps) {
    final double volume = lbs * reps;

    state = state.copyWith(
      tempTotalVolume: (state.tempTotalVolume ?? 0) + volume,
      tempTotalSets: (state.tempTotalSets ?? 0) + 1,
    );
  }

  void removeStats(double lbs, int reps) {
    final double volume = lbs * reps;

    state = state.copyWith(
      tempTotalVolume: (state.tempTotalVolume ?? 0) - volume,
      tempTotalSets: (state.tempTotalSets ?? 0) - 1,
    );
  }
}
