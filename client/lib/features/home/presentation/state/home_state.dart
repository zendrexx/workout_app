import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:flutter/foundation.dart';

class HomeState {
  final List<PlannedSessionState> session;
  HomeState({required this.session});

  factory HomeState.initial() {
    return HomeState(session: []);
  }
}
