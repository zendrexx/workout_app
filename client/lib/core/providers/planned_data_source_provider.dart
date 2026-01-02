import 'package:client/core/providers/isar_provider.dart';
import 'package:client/data/data_source/planned_workout_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plannedDataSourceProvider = Provider<PlannedWorkoutDataSource>((ref) {
  final isar = ref.watch(isarProvider).requireValue;
  return PlannedWorkoutDataSource(isar);
});
