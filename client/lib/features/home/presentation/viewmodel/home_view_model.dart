import 'dart:async';

import 'package:client/features/home/presentation/state/home_state.dart';
import 'package:client/features/home/presentation/state_mappers/to_home_state.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/usecases/delete_session.dart';
import 'package:client/features/workout_planning/domain/usecases/duplicate_session.dart';
import 'package:client/features/workout_planning/domain/usecases/watch_all_planned_session.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/usecases/watch_all_program.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  late final StreamSubscription _subSession;
  late final StreamSubscription _subProgram;
  List<PlannedWorkoutSession> _sessions = [];
  List<Program> _programs = [];
  final DeleteSession deleteSession;
  final DuplicateSession duplicateSession;
  HomeViewModel(
    WatchAllPlannedSession watchSessions,
    WatchAllProgram watchPrograms,
    this.deleteSession,
    this.duplicateSession,
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

  void _emit() {
    state = toHomeState(_sessions, _programs);
  }

  @override
  void dispose() {
    _subProgram.cancel();
    _subSession.cancel();
    super.dispose();
  }

  Future<void> deleteSessionById(String sessionId) async {
    await deleteSession.call(sessionId);
    state = state.copyWith(
      session: state.session.where((s) => s.sessionId != sessionId).toList(),
    );
  }

  Future<void> duplicateSessionById(String sessionId) async {
    await duplicateSession.call(sessionId);
    state = state.copyWith(
      session: state.session.where((s) => s.sessionId != sessionId).toList(),
    );
  }
}
