import 'dart:async';

import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_planning/domain/usecases/watch_all_planned_session.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_program/domain/usecases/add_program.dart';
import 'package:client/features/workout_program/presentation/events/program_ui_event.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';
import 'package:client/features/workout_program/presentation/state_mappers/map_program_failure.dart';
import 'package:client/features/workout_program/presentation/state_mappers/to_domain_program.dart';
import 'package:client/features/workout_program/presentation/state_mappers/to_program_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgramViewModel extends StateNotifier<ProgramState> {
  late final StreamSubscription _sub;
  final AddProgram addProgram;
  // final DeleteSession deleteSession;
  // final DuplicateSession duplicateSession;
  final _events = StreamController<ProgramUiEvent>.broadcast();
  Stream<ProgramUiEvent> get events => _events.stream;

  ProgramViewModel(
    WatchAllPlannedSession watchSessions,
    this.addProgram,
    // this.deleteSession,
    // this.duplicateSession,
  ) : super(ProgramState.initial()) {
    reset();
    _sub = watchSessions().listen((sessions) {
      state = toProgramState(sessions);
    });
  }
  Future<void> save() async {
    final programId = state.programSessionId.isNotEmpty
        ? state.programSessionId
        : IdGenerator().getId();

    final program = mapProgram(state.copyWith(programSessionId: programId));

    final result = await addProgram(program);

    result.fold(
      (failure) {
        _events.add(ShowError(mapProgramFailure(failure)));
      },
      (_) {
        state = ProgramState.initial();
        _events.add(SaveSuccess("Program saved!"));
        reset();
      },
    );
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
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

  void reset() {
    state = ProgramState(
      plannedSessions: [],
      programSessions: [],
      programName: '',
      programSessionId: '',
    );
  }
}
