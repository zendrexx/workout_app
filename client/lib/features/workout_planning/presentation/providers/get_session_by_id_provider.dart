import 'package:client/features/workout_planning/domain/usecases/get_session_by_id.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getSessionByIdProvider = Provider<GetSessionById>((ref) {
  final repo = ref.read(plannedRepositoryProvider);
  return GetSessionById(repo);
});
