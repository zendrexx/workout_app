import 'package:client/features/workout_planning/domain/usecases/delete_session.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteSessionProvider = Provider<DeleteSession>((ref) {
  final repo = ref.read(plannedRepositoryProvider);
  return DeleteSession(repo);
});
