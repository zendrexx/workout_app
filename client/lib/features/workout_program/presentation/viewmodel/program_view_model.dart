import 'dart:async';

import 'package:client/core/utils/id_generator.dart';
import 'package:client/features/workout_planning/domain/usecases/get_session_by_id.dart';
import 'package:client/features/workout_program/domain/usecases/add_program.dart';
import 'package:client/features/workout_program/domain/usecases/get_program_by_id.dart';
import 'package:client/features/workout_program/presentation/events/program_ui_event.dart';
import 'package:client/features/workout_program/presentation/state/program_session_state.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';
import 'package:client/features/workout_program/presentation/state/week_program_state.dart';
import 'package:client/features/workout_program/presentation/state_mappers/map_program_failure.dart';
import 'package:client/features/workout_program/presentation/state_mappers/to_domain_program.dart';
import 'package:client/features/workout_program/presentation/state_mappers/to_program_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgramViewModel extends StateNotifier<ProgramState> {
  final AddProgram addProgram;
  final GetProgramById getProgramById;
  final GetSessionById getSessionById;

  final _events = StreamController<ProgramUiEvent>.broadcast();
  Stream<ProgramUiEvent> get events => _events.stream;

  ProgramViewModel(this.addProgram, this.getProgramById, this.getSessionById)
    : super(ProgramState.initial());

  Future<void> save() async {
    final programId = state.programId.isNotEmpty
        ? state.programId
        : IdGenerator().getId();

    final program = mapProgram(state.copyWith(programId: programId));

    final result = await addProgram(program);

    result.fold(
      (failure) {
        _events.add(ShowError(mapProgramFailure(failure)));
      },
      (_) {
        _events.add(SaveSuccess("Program saved!"));
        reset();
      },
    );
  }

  void loadProgramById(String programId) async {
    reset();
    final program = await getProgramById.call(programId);
    state = toProgramState(program);
  }

  void addName(String newName) {
    state = state.copyWith(programName: newName);
  }

  void removeName() {
    state = state.copyWith(programName: "");
  }

  /// This feature has no multi-week authoring UI yet, so every session is
  /// added into a single implicit week ("Week 1"), created on first use.
  WeekState _currentWeek() {
    if (state.weekState.isNotEmpty) return state.weekState.first;
    return WeekState(weekId: IdGenerator().getId(), weekNumber: 1, session: []);
  }

  void _replaceCurrentWeek(WeekState week) {
    state = state.copyWith(weekState: [week]);
  }

  Future<void> addProgramSession(String plannedSessionId) async {
    final plannedSession = await getSessionById.call(plannedSessionId);
    final week = _currentWeek();

    final newSession = ProgramSessionState(
      sessionId: IdGenerator().getId(),
      createdAt: DateTime.now(),
      dayNumber: week.session.length + 1,
      sessionName: plannedSession.name,
      exercises: plannedSession.exercises.map(toStateExercise).toList(),
    );

    _replaceCurrentWeek(
      WeekState(
        weekId: week.weekId,
        weekNumber: week.weekNumber,
        session: [...week.session, newSession],
      ),
    );
  }

  void deleteProgramSessionAt(int index) {
    final week = _currentWeek();
    final sessions = List<ProgramSessionState>.from(week.session)
      ..removeAt(index);

    _replaceCurrentWeek(
      WeekState(
        weekId: week.weekId,
        weekNumber: week.weekNumber,
        session: sessions,
      ),
    );
  }

  Future<void> duplicateSession(String sessionId) async {
    final week = _currentWeek();
    final original = week.session.firstWhere((s) => s.sessionId == sessionId);

    final copy = ProgramSessionState(
      sessionId: IdGenerator().getId(),
      createdAt: DateTime.now(),
      dayNumber: week.session.length + 1,
      sessionName: original.sessionName,
      exercises: original.exercises,
    );

    _replaceCurrentWeek(
      WeekState(
        weekId: week.weekId,
        weekNumber: week.weekNumber,
        session: [...week.session, copy],
      ),
    );
  }

  void reset() {
    state = ProgramState.initial();
  }
}
