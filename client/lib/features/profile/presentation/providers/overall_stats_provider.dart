import 'package:client/features/history/presentation/providers/history_view_model_provider.dart';
import 'package:client/features/profile/presentation/state/overall_stats_state.dart';
import 'package:client/features/workout_logging/presentation/providers/watch_all_performed_session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final overallStatsProvider = Provider<OverallStatsState>((ref) {
  final historyState = ref.watch(historyViewModelProvider);

  double volume = 0;
  int sets = 0;
  int seconds = 0;
  double? prSquat = 0;
  double? prBench = 0;
  double? prDeadlift = 0;
  for (final session in historyState.psession) {
    final stats = session.performedStats;
    final squat = session.performedExercise.firstWhere(
      (exercise) => exercise.exerciseName == "Squat",
    );
    final bench = session.performedExercise.firstWhere(
      (exercise) => exercise.exerciseName == "Bench Press",
    );
    final deadlift = session.performedExercise.firstWhere(
      (exercise) => exercise.exerciseName == "Deadlift",
    );
    if (bench.sets.isNotEmpty) {
      prBench = bench.sets
          .map((set) => set.actWeight)
          .reduce((a, b) => a > b ? a : b);
    }
    if (deadlift.sets.isNotEmpty) {
      prSquat = deadlift.sets
          .map((set) => set.actWeight)
          .reduce((a, b) => a > b ? a : b);
    }
    if (squat.sets.isNotEmpty) {
      prSquat = squat.sets
          .map((set) => set.actWeight)
          .reduce((a, b) => a > b ? a : b);
    }
    volume += stats.totalVolume;
    sets += stats.totalSets;
    seconds += stats.totalSeconds;
  }

  return OverallStatsState(
    totalVolume: volume,
    totalSets: sets,
    totalSeconds: seconds,
    dates: historyState.psession.map((s) => s.endTime).toList(),
    prBench: prBench,
    prDeadlift: prDeadlift,
    prSquat: prSquat,
  );
});
