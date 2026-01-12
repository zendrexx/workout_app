import 'package:client/core/providers/database_service_provider.dart';
import 'package:client/features/workout_planning/data/datasources/planned_workout_isar_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workoutDatasourceProvider = Provider<PlannedWorkoutIsarDatasource>((ref) {
  final db = ref.read(databaseServiceProvider).value!;
  return PlannedWorkoutIsarDatasource(db);
});
