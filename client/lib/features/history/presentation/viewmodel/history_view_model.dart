import 'package:client/features/history/presentation/state/history_state.dart';
import 'package:client/features/history/presentation/state_mapper/to_history_state.dart';
import 'package:client/features/workout_logging/domain/usecases/watch_all_performed_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryViewModel extends StateNotifier<HistoryState> {
  //late final StreamSubscription _sub;
  HistoryViewModel(WatchAllPerformedSession watchSessions)
    : super(HistoryState.initial()) {
    watchSessions().listen((sessions) {
      state = toHistoryState(sessions);
    });
  }
}
