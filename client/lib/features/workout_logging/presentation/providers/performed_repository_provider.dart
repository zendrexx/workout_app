import 'package:client/features/workout_logging/data/repositories/performed_workout_repository_impl.dart';
import 'package:client/features/workout_logging/domain/repositories/performed_workout_repository.dart';
import 'package:client/features/workout_logging/presentation/providers/performed_data_source_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final performedRepositoryProvider = Provider<PerformedWorkoutRepository>((ref) {
  final datasource = ref.read(performedDatasourceProvider);
  return PerformedWorkoutRepositoryImpl(datasource);
});
