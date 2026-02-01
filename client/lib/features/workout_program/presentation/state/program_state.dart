import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';

class ProgramState {
  final String programName;
  final String programSessionId;
  final List<PlannedSessionState> programSessions;
  final List<PlannedSessionState> plannedSessions;
  ProgramState({
    required this.programName,
    required this.plannedSessions,
    required this.programSessions,
    required this.programSessionId,
  });

  factory ProgramState.initial() {
    return ProgramState(
      programName: '',
      plannedSessions: [],
      programSessions: [],
      programSessionId: '',
    );
  }

  ProgramState copyWith({
    String? programName,
    String? programSessionId,
    List<PlannedSessionState>? plannedSessions,
    List<PlannedSessionState>? programSessions,
  }) {
    return ProgramState(
      programName: programName ?? this.programName,
      programSessionId: programSessionId ?? this.programSessionId,
      plannedSessions: plannedSessions ?? this.plannedSessions,
      programSessions: programSessions ?? this.programSessions,
    );
  }
}
