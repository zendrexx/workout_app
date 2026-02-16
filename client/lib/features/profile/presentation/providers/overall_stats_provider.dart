// import 'package:client/features/profile/presentation/state/overall_stats_state.dart';
// import 'package:client/features/workout_logging/presentation/providers/watch_all_performed_session_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final overallStatsProvider = FutureProvider<OverallStatsState>((ref) async {
//   final getAllSessions = ref.watch(watchAllPerformedSessio);

//   // get all sessions from use-case
//   final sessions = await getAllSessions();

//   double volume = 0;
//   int sets = 0;
//   int seconds = 0;

//   for (final session in sessions) {
//     final stats = session.performedStats;
//     volume += stats.totalVolume;
//     sets += stats.totalSets;
//     seconds += stats.totalSeconds;
//   }

//   return OverallStatsState(
//     totalVolume: volume,
//     totalSets: sets,
//     totalSeconds: seconds,
//     dates: sessions.map((s) => s.endTime).toList(),
//   );
// });
