import 'dart:async';

import 'package:client/features/home/presentation/state_mappers/to_home_state.dart';
import 'package:client/features/workout_planning/domain/usecases/delete_session.dart';
import 'package:client/features/workout_planning/domain/usecases/duplicate_session.dart';
import 'package:client/features/workout_planning/domain/usecases/watch_all_planned_session.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/exercise_to_planned_mapper.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';
import 'package:client/features/workout_program/presentation/state_mappers/to_program_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgramViewModel extends StateNotifier<ProgramState> {
  late final StreamSubscription _sub;
  // final DeleteSession deleteSession;
  // final DuplicateSession duplicateSession;
  ProgramViewModel(
    WatchAllPlannedSession watchSessions,
    // this.deleteSession,
    // this.duplicateSession,
  ) : super(ProgramState.initial()) {
    _sub = watchSessions().listen((sessions) {
      state = toProgramState(sessions);
    });
  }

  void addName(String newName) {
    state = state.copyWith(programName: newName);
  }

  void removeName() {
    state = state.copyWith(programName: "");
  }

  void addProgramSession(PlannedSessionState session) {
    final updatedSessions = [...state.programSessions, session];

    state = state.copyWith(programSessions: updatedSessions);
  }

  void deleteProgramSessionAt(int index) {
    final sessions = List.of(state.programSessions);
    sessions.removeAt(index);

    state = state.copyWith(programSessions: sessions);
  }

  Future<void> duplicateSession(String sessionId) async {
    final original = state.programSessions.firstWhere(
      (s) => s.sessionId == sessionId,
    );

    final duplicated = original.copyWith();
    // no changes at all

    state = state.copyWith(
      programSessions: [...state.programSessions, duplicated],
    );
  }
}
