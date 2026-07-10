import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/presentation/providers/get_session_by_id_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Read-only fetch of a single session by id, kept separate from the mutable
/// create/edit view model so viewing can't be clobbered by an in-progress edit.
/// Exposes loading / error / data as distinct states (invalidate to refresh
/// after an edit).
final sessionDetailProvider = FutureProvider.autoDispose
    .family<PlannedWorkoutSession, String>((ref, sessionId) async {
      final getSessionById = ref.read(getSessionByIdProvider);
      return getSessionById.call(sessionId);
    });
