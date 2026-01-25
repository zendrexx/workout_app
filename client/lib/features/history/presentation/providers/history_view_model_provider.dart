import 'package:client/features/history/presentation/state/history_state.dart';
import 'package:client/features/history/presentation/viewmodel/history_view_model.dart';
import 'package:client/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:client/features/workout_logging/domain/usecases/watch_all_performed_session.dart';
import 'package:client/features/workout_logging/presentation/providers/watch_all_performed_session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyViewModelProvider =
    StateNotifierProvider<HistoryViewModel, HistoryState>((ref) {
      final getAllSession = ref.read(watchallPerformedSessionProvider);

      return HistoryViewModel(getAllSession);
    });
