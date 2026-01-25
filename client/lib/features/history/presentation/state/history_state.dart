import 'package:client/features/workout_logging/presentation/state/performed_session_state.dart';

class HistoryState {
  final List<PerformedSessionState> psession;
  HistoryState({required this.psession});

  factory HistoryState.initial() {
    return HistoryState(psession: []);
  }

  HistoryState copyWith({List<PerformedSessionState>? psession}) {
    return HistoryState(psession: psession ?? this.psession);
  }
}
