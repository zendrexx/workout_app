import 'package:client/features/home/presentation/state/home_state.dart';
import 'package:client/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:client/features/workout_planning/presentation/providers/get_all_planned_session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((
  ref,
) {
  final getAllSession = ref.read(getAllPlannedSessionProvider);

  return HomeViewModel(getAllSession);
});
