import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/presentation/providers/watch_all_planned_session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allPlannedSessionsProvider =
    StreamProvider.autoDispose<List<PlannedWorkoutSession>>((ref) {
      final watchAllPlannedSessions = ref.watch(watchAllPlannedSessionsProvider);
      return watchAllPlannedSessions.call();
    });
