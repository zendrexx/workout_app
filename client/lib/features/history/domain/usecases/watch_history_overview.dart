import 'package:client/features/history/domain/entities/history_overview.dart';
import 'package:client/features/history/domain/repositories/history_repository.dart';

class WatchHistoryOverview {
  final HistoryRepository repo;
  WatchHistoryOverview(this.repo);

  Stream<HistoryOverview> call() {
    return repo.watchHistoryOverview();
  }
}
