import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';

class WeekState {
  late String weekId;

  late int weekNumber;

  final List<String> sessionIds;
  WeekState({
    required this.weekId,
    required this.weekNumber,
    required this.sessionIds,
  });
}
