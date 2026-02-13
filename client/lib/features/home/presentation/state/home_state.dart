// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_program/presentation/state/program_state.dart';

import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';

class HomeState {
  final List<PlannedSessionState> session;
  final List<ProgramState> program;

  final bool isProgramMode;
  final String? activeProgramId;

  const HomeState({
    required this.session,
    required this.program,
    required this.isProgramMode,
    required this.activeProgramId,
  });

  factory HomeState.initial() => HomeState(
    session: [],
    program: [],
    isProgramMode: false,
    activeProgramId: null,
  );

  HomeState copyWith({
    List<PlannedSessionState>? session,
    List<ProgramState>? program,
    bool? isProgramMode,
    String? activeProgramId,
  }) {
    return HomeState(
      session: session ?? this.session,
      program: program ?? this.program,
      isProgramMode: isProgramMode ?? this.isProgramMode,
      activeProgramId: activeProgramId ?? this.activeProgramId,
    );
  }
}
