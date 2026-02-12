import 'package:client/core/database/database_service.dart';
import 'package:client/features/workout_planning/data/datasources/planned_workout_isar_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workoutDatasourceProvider = Provider<PlannedWorkoutIsarDatasource>((ref) {
  final isar = ref.watch(isarProvider).requireValue;
  return PlannedWorkoutIsarDatasource(isar);
});
