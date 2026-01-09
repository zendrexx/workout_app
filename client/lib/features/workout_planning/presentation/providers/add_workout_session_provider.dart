import 'package:client/features/workout_planning/domain/usecases/add_workout_session.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addWorkoutSessionProvider = Provider<AddWorkoutSession>((ref) {
  final repo = ref.read(plannedRepositoryProvider);
  return AddWorkoutSession(repo);
});
