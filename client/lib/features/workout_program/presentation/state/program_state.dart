import 'package:client/features/workout_program/presentation/state/week_program_state.dart';

class ProgramState {
  final String programName;
  final String programId;
  final List<WeekState> weekState;

  ProgramState({
    required this.programName,
    required this.programId,
    required this.weekState,
  });

  factory ProgramState.initial() {
    return ProgramState(programName: '', programId: '', weekState: []);
  }

  ProgramState copyWith({
    String? programName,
    String? programId,
    final List<WeekState>? weekState,
  }) {
    return ProgramState(
      programName: programName ?? this.programName,
      programId: programId ?? this.programId,
      weekState: weekState ?? this.weekState,
    );
  }
}
