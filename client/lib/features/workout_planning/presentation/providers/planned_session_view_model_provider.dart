import 'package:client/features/workout_planning/presentation/providers/add_workout_session_provider.dart';
import 'package:client/features/workout_planning/presentation/providers/get_all_exercise_provider.dart';
import 'package:client/features/workout_planning/presentation/providers/get_session_by_id_provider.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/viewmodel/planned_session_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plannedSessionViewModelProvider =
    StateNotifierProvider<PlannedSessionViewmodel, PlannedSessionState>((ref) {
      final addSession = ref.read(addWorkoutSessionProvider);
      final getSessionById = ref.read(getSessionByIdProvider);

      return PlannedSessionViewmodel(addSession, getSessionById);
    });
