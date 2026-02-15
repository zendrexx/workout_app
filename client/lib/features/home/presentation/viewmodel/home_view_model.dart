import 'dart:async';

import 'package:client/features/home/presentation/state/home_state.dart';
import 'package:client/features/home/presentation/state_mappers/to_home_state.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/usecases/delete_session.dart';
import 'package:client/features/workout_planning/domain/usecases/duplicate_session.dart';
import 'package:client/features/workout_planning/domain/usecases/watch_all_planned_session.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/usecases/delete_program.dart';
import 'package:client/features/workout_program/domain/usecases/duplicate_program.dart';
import 'package:client/features/workout_program/domain/usecases/watch_all_program.dart';
import 'package:client/features/workout_program/presentation/state_mappers/to_program_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  late final StreamSubscription _subSession;
  late final StreamSubscription _subProgram;
  List<PlannedWorkoutSession> _sessions = [];
  List<Program> _programs = [];
  final DeleteSession deleteSession;
  final DuplicateSession duplicateSession;
  final DeleteProgram deleteProgram;
  final DuplicateProgram duplicateProgram;
  HomeViewModel(
    WatchAllPlannedSession watchSessions,
    WatchAllProgram watchPrograms,
    this.deleteSession,
    this.duplicateSession,
    this.deleteProgram,
    this.duplicateProgram,
  ) : super(HomeState.initial()) {
    _subSession = watchSessions().listen((sessions) {
      _sessions = sessions;
      _emit();
    });

    _subProgram = watchPrograms().listen((programs) {
      _programs = programs;
      _emit();
    });
  }
  /*
the session can be in 2 modes either program mode or all session
if program mode is active then we show only the session that are in the active program
if all session mode is active then we show all the session

when loading the home, it checks if there is an active program and it will automatically
load the sessions in that program, if there is no active then load all session

the program card will watch the session using all sessions

if the user deleted a session that is in the active program, 
it will automatically remove it from the program session list
*/
  void _emit() {
    //this will be the function that will emit the state to the UI, it will check if there is an active program and load the sessions accordingly
    final allSessionStates = _sessions.map(toStateSession).toList();
    final programStates = _programs.map(toProgramState).toList();

    if (state.isProgramMode && state.activeProgramId != null) {
      final program = _programs.firstWhere(
        (p) => p.programId == state.activeProgramId,
      );

      if (program != null) {
        final filteredSessions = program.sessionIds
            .map((id) => _sessions.firstWhere((s) => s.sessionId == id))
            .map(toStateSession)
            .toList();

        state = state.copyWith(
          session: filteredSessions,
          program: programStates,
        );
        return;
      }
    }

    // default: show all sessions
    state = state.copyWith(session: allSessionStates, program: programStates);
  }

  @override
  void dispose() {
    _subProgram.cancel();
    _subSession.cancel();
    super.dispose();
  }

  void startProgram(String programId) {
    state = state.copyWith(isProgramMode: true, activeProgramId: programId);

    _emit();
  }

  void _loadProgramSessions(String programId) {
    final program = _programs
        .where((p) => p.programId == programId)
        .firstOrNull;

    if (program == null) return;

    final sessions = program.sessionIds
        .map((id) => _sessions.firstWhere((s) => s.sessionId == id))
        .map((s) => toStateSession(s))
        .toList();

    state = state.copyWith(session: sessions);
  }

  void showAllSessions() {
    state = state.copyWith(
      isProgramMode: false,
      activeProgramId: null,
      session: _sessions.map(toStateSession).toList(),
    );
    _emit();
  }

  Future<void> deleteSessionById(String sessionId) async {
    await deleteSession.call(sessionId);
  }

  Future<void> duplicateSessionById(String sessionId) async {
    await duplicateSession.call(sessionId);
  }

  Future<void> deleteProgramnById(String programSessionId) async {
    await deleteProgram.call(programSessionId);
    state = state.copyWith(
      program: state.program
          .where((s) => s.programSessionId != programSessionId)
          .toList(),
    );
  }

  Future<void> duplicateProgramById(String programSessionId) async {
    await duplicateProgram.call(programSessionId);
    state = state.copyWith(
      program: state.program
          .where((s) => s.programSessionId != programSessionId)
          .toList(),
    );
  }
}
