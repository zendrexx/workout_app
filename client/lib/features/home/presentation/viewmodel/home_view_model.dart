import 'package:client/features/home/presentation/state/home_state.dart';
import 'package:client/features/home/presentation/state_mappers/to_home_state.dart';
import 'package:client/features/workout_planning/domain/usecases/delete_session.dart';
import 'package:client/features/workout_planning/domain/usecases/get_all_planned_session.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final GetAllPlannedSession getAllPlannedSession;
  final DeleteSession deleteSession;
  HomeViewModel(this.getAllPlannedSession, this.deleteSession)
    : super(HomeState.initial());
  Future<void> loadAllPlannedSession() async {
    final plannedSession = await getAllPlannedSession.call();

    state = toHomeState(plannedSession);
  }

  Future<void> deleteSessionById(int id) async {
    await deleteSession.call(id);
  }
}
