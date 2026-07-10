import 'package:client/features/workout_program/presentation/state/program_session_state.dart';

class WeekState {
  late String weekId;

  late int weekNumber;

  final List<ProgramSessionState> session;
  WeekState({
    required this.weekId,
    required this.weekNumber,
    required this.session,
  });
}
