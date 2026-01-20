import 'package:client/features/workout_logging/presentation/state/workout_logging_state.dart';
import 'package:client/features/workout_logging/presentation/statemappers/to_workout_logging_state.dart';
import 'package:client/features/workout_planning/domain/usecases/get_session_by_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutLoggingViewModel extends StateNotifier<WorkoutLoggingState> {
  GetSessionById getSessionById;
  WorkoutLoggingViewModel(this.getSessionById)
    : super(WorkoutLoggingState.initial());

  Future<void> loadPlannedSessionToLogging(String sessionId) async {
    final session = await getSessionById.call(sessionId);

    state = toWorkoutLoggingState(session);
  }
}
