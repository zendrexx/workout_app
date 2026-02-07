import 'package:client/features/home/presentation/state/home_state.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/presentation/state/program_state.dart';
import 'package:client/features/workout_program/presentation/state_mappers/to_program_state.dart';

HomeState toHomeState(
  List<PlannedWorkoutSession> session,
  List<Program> program,
) {
  return HomeState(
    session: session
        .map<PlannedSessionState>((s) => toStateSession(s))
        .toList(),
    program: program.map<ProgramState>((s) => toProgramState(s)).toList(),
  );
}
