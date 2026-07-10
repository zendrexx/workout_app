import 'package:client/features/history/data/repositories/performed_history_repository.dart';
import 'package:client/features/history/domain/entities/history_overview.dart';
import 'package:client/features/history/domain/repositories/history_repository.dart';
import 'package:client/features/history/domain/usecases/watch_history_overview.dart';
import 'package:client/features/workout_logging/presentation/providers/performed_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  return PerformedHistoryRepository(ref.read(performedRepositoryProvider));
});

final watchHistoryOverviewProvider = Provider<WatchHistoryOverview>((ref) {
  return WatchHistoryOverview(ref.read(historyRepositoryProvider));
});

/// Live view of the user's training history, recomputed whenever a
/// performed session is added to the database.
final historyOverviewProvider = StreamProvider.autoDispose<HistoryOverview>((
  ref,
) {
  return ref.read(watchHistoryOverviewProvider).call();
});
