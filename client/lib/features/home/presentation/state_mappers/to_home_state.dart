import 'package:client/features/home/presentation/state/home_state.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';

HomeState toHomeState(List<PlannedWorkoutSession> session) {
  return HomeState(
    session: session
        .map<PlannedSessionState>((s) => toStateSession(s))
        .toList(),
  );
}
