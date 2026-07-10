import 'package:client/features/history/domain/entities/history_overview.dart';

/// Source of aggregated training history for the History page.
///
/// Exposed as a stream so the page updates live whenever a workout is
/// logged, without any manual refresh.
abstract class HistoryRepository {
  Stream<HistoryOverview> watchHistoryOverview();
}
