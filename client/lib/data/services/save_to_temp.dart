import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:client/data/models/planned_session.dart';
import 'package:client/data/services/planned_session_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveToTemp {
  final WidgetRef ref;
  const SaveToTemp({required this.ref});

  void addName(String title) {
    ref.read(tempSessionProvider.notifier).addTitle(title);
  }

  void convertToTemp(int id) async {
    final sessionService = PlannedSessionService();

    final session = await sessionService.getSessionById(id);
    if (session != null) {
      if (session.name != null) {
        addName(session.name!);
      }
      // if(){

      // }
    }
  }
}
