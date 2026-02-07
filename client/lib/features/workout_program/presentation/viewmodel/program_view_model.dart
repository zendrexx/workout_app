import 'dart:async';

import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_planning/domain/usecases/watch_all_planned_session.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
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
      final sessionMap = {
        for (final s in sessions) s.sessionId: toStateSession(s),
      };
      state = state.copyWith(plannedSessions: sessionMap);
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

  void addProgramSession(String sessionId) {
    final updatedSessions = [...state.programSessionIds, sessionId];

    state = state.copyWith(programSessionIds: updatedSessions);
  }

  void deleteProgramSessionAt(int index) {
    final sessions = List<String>.from(state.programSessionIds);
    sessions.removeAt(index);

    state = state.copyWith(programSessionIds: sessions);
  }

  Future<void> duplicateSession(String sessionId) async {
    final original = state.programSessionIds.firstWhere((s) => s == sessionId);

    state = state.copyWith(
      programSessionIds: [...state.programSessionIds, original],
    );
  }

  void reset() {
    state = ProgramState(
      plannedSessions: {},
      programSessionIds: [],
      programName: '',
      programSessionId: '',
    );
  }
}
