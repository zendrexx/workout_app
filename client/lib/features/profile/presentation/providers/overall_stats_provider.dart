// import 'package:client/features/profile/presentation/state/overall_stats_state.dart';
// import 'package:client/features/workout_logging/presentation/providers/watch_all_performed_session_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final overallStatsProvider = Provider<AsyncValue<OverallStatsState>>((ref) {
//   final sessionsAsync = ref.watch(watchallPerformedSessionProvider);

//   return sessionsAsync.when(
//     data: (sessions) {
//       double volume = 0;
//       int sets = 0;
//       int seconds = 0;

//       for (final session in sessions) {
//         final stats = session.performedStats;
//         volume += stats.totalVolume;
//         sets += stats.totalSets;
//         seconds += stats.totalSeconds;
//       }

//       return AsyncData(
//         OverallStatsState(
//           totalVolume: volume,
//           totalSets: sets,
//           totalSeconds: seconds,
//           dates: sessions.map((s) => s.endTime).toList(),
//         ),
//       );
//     },
//     loading: () => const AsyncLoading(),
//     error: (e, s) => AsyncError(e, s),
//   );
// });
