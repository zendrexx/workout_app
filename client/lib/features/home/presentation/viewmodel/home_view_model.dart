import 'dart:async';

import 'package:client/features/home/presentation/state/home_state.dart';
import 'package:client/features/home/presentation/state_mappers/to_home_state.dart';
import 'package:client/features/workout_planning/domain/usecases/delete_session.dart';
import 'package:client/features/workout_planning/domain/usecases/duplicate_session.dart';
import 'package:client/features/workout_planning/domain/usecases/watch_all_planned_session.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  late final StreamSubscription _sub;
  final DeleteSession deleteSession;
  final DuplicateSession duplicateSession;
  HomeViewModel(
    WatchAllPlannedSession watchSessions,
    this.deleteSession,
    this.duplicateSession,
  ) : super(HomeState.initial()) {
    _sub = watchSessions().listen((sessions) {
      state = toHomeState(sessions);
    });
  }
  @override
  void dispose() {
    _sub.cancel();
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
