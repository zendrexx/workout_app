import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Snapshot of the rest countdown between sets. [remaining] counts down to 0;
/// when it reaches 0 the timer becomes inactive and the banner hides itself.
class RestTimerState {
  final int remaining;
  final int total;
  final bool isActive;

  const RestTimerState({
    required this.remaining,
    required this.total,
    required this.isActive,
  });

  factory RestTimerState.idle() =>
      const RestTimerState(remaining: 0, total: 0, isActive: false);

  double get progress => total == 0 ? 0 : remaining / total;

  RestTimerState copyWith({int? remaining, int? total, bool? isActive}) {
    return RestTimerState(
      remaining: remaining ?? this.remaining,
      total: total ?? this.total,
      isActive: isActive ?? this.isActive,
    );
  }
}

/// Drives the between-sets rest countdown. Kept out of the view model so a
/// ticking rest timer never rebuilds the exercise cards — only the banner
/// watching this provider re-renders each second.
class RestTimerNotifier extends StateNotifier<RestTimerState> {
  RestTimerNotifier() : super(RestTimerState.idle());

  static const int defaultRest = 90;

  Timer? _ticker;

  /// Starts (or restarts) a rest countdown of [seconds].
  void start([int seconds = defaultRest]) {
    _ticker?.cancel();
    state = RestTimerState(remaining: seconds, total: seconds, isActive: true);
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      final next = state.remaining - 1;
      if (next <= 0) {
        _ticker?.cancel();
        state = RestTimerState(remaining: 0, total: state.total, isActive: false);
      } else {
        state = state.copyWith(remaining: next);
      }
    });
  }

  /// Adjusts the running countdown by [delta] seconds (clamped at 5s minimum).
  void add(int delta) {
    if (!state.isActive) return;
    final remaining = (state.remaining + delta).clamp(5, 3600);
    final total = remaining > state.total ? remaining : state.total;
    state = state.copyWith(remaining: remaining, total: total);
  }

  /// Ends the rest immediately (user tapped Skip / dismiss).
  void skip() {
    _ticker?.cancel();
    state = RestTimerState.idle();
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }
}

final restTimerProvider =
    StateNotifierProvider.autoDispose<RestTimerNotifier, RestTimerState>(
      (ref) => RestTimerNotifier(),
    );
