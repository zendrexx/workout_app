import 'package:client/features/workout_logging/domain/usecases/add_performed_session.dart';
import 'package:client/features/workout_logging/presentation/providers/performed_data_source_provider.dart';
import 'package:client/features/workout_logging/presentation/providers/performed_repository_provider.dart';
import 'package:client/features/workout_planning/domain/usecases/add_workout_session.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPerformedSessionProvider = Provider<AddPerformedSession>((ref) {
  final repo = ref.read(performedRepositoryProvider);
  return AddPerformedSession(repo);
});
