// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';

class HomeState {
  final List<PlannedSessionState> session;
  HomeState({required this.session});

  factory HomeState.initial() {
    return HomeState(session: []);
  }

  HomeState copyWith({List<PlannedSessionState>? session}) {
    return HomeState(session: session ?? this.session);
  }
}
