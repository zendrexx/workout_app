import 'package:client/features/workout_logging/presentation/providers/add_performed_session_provider.dart';
import 'package:client/features/workout_logging/presentation/state/performed_session_state.dart';
import 'package:client/features/workout_logging/presentation/viewmodel/workout_logging_view_model.dart';
import 'package:client/features/workout_planning/presentation/providers/get_session_by_id_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workoutLoggingViewModelProvider =
    StateNotifierProvider.autoDispose<
      WorkoutLoggingViewModel,
      PerformedSessionState
    >((ref) {
      final getSessionById = ref.read(getSessionByIdProvider);
      final addPerformedSession = ref.read(addPerformedSessionProvider);
      return WorkoutLoggingViewModel(getSessionById, addPerformedSession);
    });
