import 'package:client/features/history/presentation/providers/history_view_model_provider.dart';
import 'package:client/features/profile/presentation/state/overall_stats_state.dart';
import 'package:client/features/workout_logging/presentation/providers/watch_all_performed_session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final overallStatsProvider = Provider<OverallStatsState>((ref) {
  final historyState = ref.watch(historyViewModelProvider);

  double volume = 0;
  int sets = 0;
  int seconds = 0;

  for (final session in historyState.psession) {
    final stats = session.performedStats;
    volume += stats.totalVolume;
    sets += stats.totalSets;
    seconds += stats.totalSeconds;
  }

  return OverallStatsState(
    totalVolume: volume,
    totalSets: sets,
    totalSeconds: seconds,
    dates: historyState.psession.map((s) => s.endTime).toList(),
  );
});
