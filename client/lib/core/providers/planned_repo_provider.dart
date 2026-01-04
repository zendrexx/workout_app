import 'package:client/core/providers/planned_data_source_provider.dart';
import 'package:client/features/workout_planning/domain/repositories/planned_workout_session_repository.dart';
import 'package:client/data/repositories/planned_session_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plannedRepoProvider = Provider<PlannedSessionAbstract>((ref) {
  return PlannedSessionRepo(ref.read(plannedDataSourceProvider));
});
