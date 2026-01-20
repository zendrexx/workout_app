import 'package:client/features/workout_logging/presentation/state/workout_logging_state.dart';
import 'package:client/features/workout_logging/presentation/viewmodel/workout_logging_view_model.dart';
import 'package:client/features/workout_planning/domain/usecases/get_session_by_id.dart';
import 'package:client/features/workout_planning/presentation/providers/get_session_by_id_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workoutLoggingViewModelProvider =
    StateNotifierProvider<WorkoutLoggingViewModel, WorkoutLoggingState>((ref) {
      final getSessionById = ref.read(getSessionByIdProvider);
      return WorkoutLoggingViewModel(getSessionById);
    });
