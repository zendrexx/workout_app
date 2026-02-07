import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';

class ProgramState {
  final String programName;
  final String programSessionId;
  final List<String> programSessionIds;
  final Map<String, PlannedSessionState> plannedSessions;
  ProgramState({
    required this.programName,
    required this.plannedSessions,
    required this.programSessionIds,
    required this.programSessionId,
  });
  List<PlannedSessionState> get sessions => plannedSessions.values.toList();
  List<PlannedSessionState> get programSessions => programSessionIds
      .map((id) => plannedSessions[id])
      .whereType<PlannedSessionState>()
      .toList();
  factory ProgramState.initial() {
    return ProgramState(
      programName: '',
      plannedSessions: {},
      programSessionIds: [],
      programSessionId: '',
    );
  }

  ProgramState copyWith({
    String? programName,
    String? programSessionId,
    Map<String, PlannedSessionState>? plannedSessions,
    List<String>? programSessionIds,
  }) {
    return ProgramState(
      programName: programName ?? this.programName,
      programSessionId: programSessionId ?? this.programSessionId,
      plannedSessions: plannedSessions ?? this.plannedSessions,
      programSessionIds: programSessionIds ?? this.programSessionIds,
    );
  }
}
