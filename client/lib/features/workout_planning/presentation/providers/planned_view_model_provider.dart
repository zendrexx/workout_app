import 'package:client/features/workout_planning/presentation/providers/create_workout_session_provider.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/viewmodel/planned_workout_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plannedViewModelProvider =
    StateNotifierProvider<PlannedWorkoutViewmodel, PlannedSessionState>((ref) {
      final createSession = ref.read(createWorkoutSessionProvider);
      return PlannedWorkoutViewmodel(createSession);
    });
