import 'package:client/features/history/presentation/state/history_state.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:client/features/workout_logging/presentation/state/performed_session_state.dart';
import 'package:client/features/workout_logging/presentation/statemappers/to_performed_session_state.dart';

HistoryState toHistoryState(List<PerformedSession> session) {
  return HistoryState(
    psession: session
        .map<PerformedSessionState>((s) => toPerformedSessionState(s))
        .toList(),
  );
}
