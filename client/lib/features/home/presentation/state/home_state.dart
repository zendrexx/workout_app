// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';
import 'package:flutter/foundation.dart';

import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';

class HomeState {
  final List<PlannedSessionState> session;
  final List<ProgramState> program;
  HomeState({required this.session, required this.program});

  factory HomeState.initial() {
    return HomeState(session: [], program: []);
  }

  HomeState copyWith({
    List<PlannedSessionState>? session,
    List<ProgramState>? program,
  }) {
    return HomeState(
      session: session ?? this.session,
      program: program ?? this.program,
    );
  }
}
