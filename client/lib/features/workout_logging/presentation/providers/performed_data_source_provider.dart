import 'package:client/core/database/database_service.dart';
import 'package:client/core/providers/database_service_provider.dart';
import 'package:client/features/workout_logging/data/datasources/performed_workout_isar_datasource.dart';
import 'package:client/features/workout_planning/data/datasources/planned_workout_isar_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final performedDatasourceProvider = Provider<PerformedWorkoutIsarDatasource>((
  ref,
) {
  final isar = ref.watch(isarProvider).requireValue;
  return PerformedWorkoutIsarDatasource(isar);
});
