import 'package:client/features/workout_logging/domain/usecases/add_performed_session.dart';
import 'package:client/features/workout_logging/presentation/providers/performed_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPerformedSessionProvider = Provider<AddPerformedSession>((ref) {
  final repo = ref.read(performedRepositoryProvider);
  return AddPerformedSession(repo);
});
