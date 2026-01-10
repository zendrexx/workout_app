import 'package:client/features/workout_planning/domain/usecases/get_all_exercise.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllExerciseProvider = Provider<GetAllExercise>((ref) {
  final repo = ref.read(plannedRepositoryProvider);
  return GetAllExercise(repo);
});
