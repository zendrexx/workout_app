import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_program/presentation/state/week_program_state.dart';

class ProgramState {
  final String programName;
  final String programId;
  final List<WeekState> weekState;
  //final Map<String, PlannedSessionState> plannedSessions;

  ProgramState({
    required this.programName,
    required this.programId,
    required this.weekState,
    //required this.plannedSessions,
  });

  //List<PlannedSessionState> get sessions => plannedSessions.values.toList();

  factory ProgramState.initial() {
    return ProgramState(programName: '', programId: '', weekState: []);
  }

  ProgramState copyWith({
    String? programName,
    String? programId,
    final List<WeekState>? weekState,
    //Map<String, PlannedSessionState>? plannedSessions,
  }) {
    return ProgramState(
      programName: programName ?? this.programName,
      programId: programId ?? this.programId,
      weekState: weekState ?? this.weekState,
      // plannedSessions: plannedSessions ?? this.plannedSessions,
    );
  }
}
