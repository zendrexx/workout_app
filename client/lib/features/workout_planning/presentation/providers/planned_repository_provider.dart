import 'package:client/features/workout_planning/data/repositories/planned_workout_repository_impl.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_data_source_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plannedRepositoryProvider = Provider<PlannedWorkoutSessionRepository>((
  ref,
) {
  final datasource = ref.read(workoutDatasourceProvider);
  return PlannedWorkoutRepositoryImpl(datasource);
});
