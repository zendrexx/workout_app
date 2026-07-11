import 'dart:async';

import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_logging/presentation/events/performed_session_io_event.dart';
import 'package:client/features/workout_logging/presentation/pages/workout_summary_page.dart';
import 'package:client/features/workout_logging/presentation/providers/workout_logging_view_model_provider.dart';
import 'package:client/features/workout_logging/presentation/widgets/exercise_log_card.dart';
import 'package:client/features/workout_logging/presentation/widgets/rest_timer_banner.dart';
import 'package:client/features/workout_logging/presentation/widgets/workout_stats_bar.dart';
import 'package:client/features/workout_program/presentation/providers/active_program_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogWorkoutPage extends ConsumerStatefulWidget {
  final String? sessionId;

  /// When launched from an active program, these identify the scheduled day
  /// to load instead of a standalone planned session.
  final String? programId;
  final int? week;
  final int? day;

  const LogWorkoutPage({
    super.key,
    this.sessionId,
    this.programId,
    this.week,
    this.day,
  });

  @override
  ConsumerState<LogWorkoutPage> createState() => _LogWorkoutPageState();
}

class _LogWorkoutPageState extends ConsumerState<LogWorkoutPage> {
  Timer? _timer;

  /// Elapsed workout seconds. A [ValueNotifier] (not page state) so the ticking
  /// clock only rebuilds the duration tile — never the exercise cards or their
  /// text fields.
  final ValueNotifier<int> _elapsed = ValueNotifier<int>(0);

  late final StreamSubscription<PerformedSessionUiEvent> _subscription;

  @override
  void initState() {
    super.initState();

    _startTimer();
    final vm = ref.read(workoutLoggingViewModelProvider.notifier);
    if (widget.programId != null) {
      vm.loadProgramWorkout(widget.programId!, widget.week ?? 1, widget.day ?? 1);
    } else if (widget.sessionId != null) {
      vm.loadPlannedSessionToLogging(widget.sessionId!);
    }

    _subscription = vm.events.listen((event) {
      if (!mounted) return;
      switch (event) {
        case ShowError(:final message):
          _showSnack(message);
          break;
        case SaveSuccess(:final message):
          _showSnack(message);
          // Program progress may have advanced; refresh the Home page.
          ref.invalidate(activeProgramProvider);
          Navigator.pop(context);
          break;
      }
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _elapsed.value++;
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _timer?.cancel();
    _elapsed.dispose();
    super.dispose();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Appcolors.secondaryColor,
          content: Text(message, style: const TextStyle(color: Colors.white)),
        ),
      );
  }

  bool get _hasCompletedSet => ref
      .read(workoutLoggingViewModelProvider)
      .performedExercise
      .any((e) => e.sets.any((s) => s.isCompleted));

  Future<void> _finish() async {
    if (!_hasCompletedSet) {
      _showSnack("Complete at least one set to finish your workout");
      return;
    }

    final result =
        await Navigator.of(context, rootNavigator: true)
            .push<WorkoutSummaryResult>(
              MaterialPageRoute(
                builder: (_) =>
                    WorkoutSummaryPage(elapsedSeconds: _elapsed.value),
                fullscreenDialog: true,
              ),
            );

    if (result == null || !result.save || !mounted) return;

    final vm = ref.read(workoutLoggingViewModelProvider.notifier);
    vm.addName(result.name);
    vm.addDuration(_elapsed.value);
    await vm.save(); // SaveSuccess/ShowError handled by the event listener.
  }

  Future<void> _confirmCancel() async {
    final hasExercises = ref
        .read(workoutLoggingViewModelProvider)
        .performedExercise
        .isNotEmpty;

    if (!hasExercises) {
      _discard();
      return;
    }

    final discard = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: Appcolors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        title: const Text(
          "Discard workout?",
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          "This workout hasn't been saved. Your logged sets will be lost.",
          style: TextStyle(color: Appcolors.muteText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text(
              "Keep logging",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text(
              "Discard",
              style: TextStyle(color: Appcolors.danger),
            ),
          ),
        ],
      ),
    );

    if (discard == true) _discard();
  }

  void _discard() {
    ref.invalidate(workoutLoggingViewModelProvider);
    context.push('/home');
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workoutLoggingViewModelProvider);
    final exercises = state.performedExercise;

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Log Workout",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Appcolors.backgroundColor,
        actions: [
          TextButton(
            onPressed: _confirmCancel,
            child: const Text(
              "Cancel",
              style: TextStyle(color: Appcolors.danger, fontSize: 15),
            ),
          ),
          const SizedBox(width: 8),
        ],
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WorkoutStatsBar(
                    elapsedSeconds: _elapsed,
                    totalVolume: state.performedStats.totalVolume,
                    completedSets: state.performedStats.totalSets,
                  ),
                  const SizedBox(height: 16),
                  const RestTimerBanner(),
                  if (exercises.isEmpty)
                    _EmptyState(onAdd: _addExercise)
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        final current = exercises[index];
                        return ExerciseLogCard(
                          key: ValueKey(
                            '${current.exId}-$index-${current.sets.length}',
                          ),
                          title: current.exerciseName,
                          equipment: current.equipment,
                          imagePath: current.imagePath,
                          index: index,
                          plannedSets: current.sets,
                          notes: current.notes,
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
          if (exercises.isNotEmpty) _bottomBar(state.performedStats.totalSets > 0),
        ],
      ),
    );
  }

  void _addExercise() {
    context.push(
      "/home/create_sessions/add_exercise",
      extra: workoutLoggingViewModelProvider,
    );
  }

  /// Shown only once at least one exercise exists — the empty state already
  /// carries its own "Add Exercise" call to action, so this bar would
  /// otherwise duplicate it.
  Widget _bottomBar(bool canFinish) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: Appcolors.backgroundColor,
        border: Border(top: BorderSide(color: Appcolors.secondaryColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ActionButton(
              label: "Add Exercise",
              icon: Icons.add,
              filled: false,
              onTap: _addExercise,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ActionButton(
              label: "Finish Workout",
              icon: Icons.flag_rounded,
              filled: true,
              enabled: canFinish,
              onTap: _finish,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool filled;
  final bool enabled;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.filled,
    this.enabled = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool active = filled && enabled;
    final Color fill = active ? Appcolors.success : Appcolors.primaryColor;
    final Color foreground = active
        ? Appcolors.backgroundColor
        : (filled ? Appcolors.muteText : Colors.white);

    return Material(
      color: fill,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        // Still tappable when disabled-looking so Finish can surface the
        // "complete at least one set" hint instead of silently doing nothing.
        onTap: onTap,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: active ? null : Border.all(color: Appcolors.secondaryColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: foreground),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: foreground,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Shown before the first exercise is added — a clear, friendly call to action
/// instead of a blank screen.
class _EmptyState extends StatelessWidget {
  final VoidCallback onAdd;
  const _EmptyState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Appcolors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.fitness_center,
                size: 32,
                color: Appcolors.muteText,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Let's get to work",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Add your first exercise to start logging.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Appcolors.muteText, fontSize: 13),
            ),
            const SizedBox(height: 20),
            Material(
              color: Appcolors.accent,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: onAdd,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 18, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Add Exercise",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
