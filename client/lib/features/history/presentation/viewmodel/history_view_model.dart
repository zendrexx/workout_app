import 'dart:async';

import 'package:client/features/workout_logging/domain/usecases/watch_all_performed_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryViewModel extends StateNotifier<>{
  late final StreamSubscription _sub;
  HistoryViewModel(WatchAllPerformedSession watchSessions):super;
}
