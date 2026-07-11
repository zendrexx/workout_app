import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/utils/format_number.dart';
import 'package:client/features/workout_logging/presentation/providers/workout_logging_view_model_provider.dart';
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// What the summary hands back to the logging page. Kept tiny on purpose: the
/// summary only *collects intent* — the logging page owns the actual save so
/// there's a single place listening for save success/failure.
class WorkoutSummaryResult {
  final bool save;
  final String name;
  const WorkoutSummaryResult({required this.save, required this.name});
}

/// The celebration shown after tapping "Finish". Turns a finished session into
/// an achievement: hero header, animated stat tiles and a per-exercise
/// breakdown. Sections that need data we don't compute yet (PRs, calories,
/// muscle groups, comparison to last time) are intentionally left out and will
/// slot in here once that data exists.
class WorkoutSummaryPage extends ConsumerStatefulWidget {
  final int elapsedSeconds;

  const WorkoutSummaryPage({super.key, required this.elapsedSeconds});

  @override
  ConsumerState<WorkoutSummaryPage> createState() => _WorkoutSummaryPageState();
}

class _WorkoutSummaryPageState extends ConsumerState<WorkoutSummaryPage> {
  late final TextEditingController _nameController;
  bool _nameError = false;

  @override
  void initState() {
    super.initState();
    final existing = ref.read(workoutLoggingViewModelProvider).name;
    _nameController = TextEditingController(text: existing);
    HapticFeedback.mediumImpact();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onSave() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() => _nameError = true);
      return;
    }
    Navigator.of(context).pop(WorkoutSummaryResult(save: true, name: name));
  }

  void _onDiscard() {
    Navigator.of(context).pop(
      const WorkoutSummaryResult(save: false, name: ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workoutLoggingViewModelProvider);
    final exercises = state.performedExercise;

    final totalVolume = state.performedStats.totalVolume;
    final totalSets = state.performedStats.totalSets;
    final totalReps = _totalReps(exercises);
    final completedExercises = exercises
        .where((e) => e.sets.any((s) => s.isCompleted))
        .length;
    final topSet = _biggestLift(exercises);

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _hero(),
                    const SizedBox(height: 28),
                    _nameField(),
                    const SizedBox(height: 20),
                    _statGrid(
                      totalVolume: totalVolume,
                      totalSets: totalSets,
                      totalReps: totalReps,
                      completedExercises: completedExercises,
                      topSet: topSet,
                    ),
                    const SizedBox(height: 24),
                    if (exercises.isNotEmpty) ...[
                      _sectionLabel("EXERCISES"),
                      const SizedBox(height: 10),
                      ...exercises.map(_exerciseRow),
                    ],
                    // Future, data-driven sections slot in here as the data
                    // becomes available: New PRs, muscle groups trained,
                    // estimated calories, comparison to last session.
                  ],
                ),
              ),
            ),
            _bottomBar(),
          ],
        ),
      ),
    );
  }

  int _totalReps(List<PerformedExerciseState> exercises) {
    var reps = 0;
    for (final e in exercises) {
      for (final s in e.sets) {
        if (s.isCompleted) reps += s.actRep;
      }
    }
    return reps;
  }

  /// Heaviest completed set across the session — the "biggest lift today".
  ({double weight, int reps})? _biggestLift(
    List<PerformedExerciseState> exercises,
  ) {
    double weight = 0;
    int reps = 0;
    var found = false;
    for (final e in exercises) {
      for (final s in e.sets) {
        if (s.isCompleted && s.actWeight >= weight) {
          weight = s.actWeight;
          reps = s.actRep;
          found = true;
        }
      }
    }
    return found ? (weight: weight, reps: reps) : null;
  }

  Widget _hero() {
    return Center(
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 450),
            curve: Curves.elasticOut,
            builder: (context, value, child) =>
                Transform.scale(scale: value, child: child),
            child: Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: Appcolors.success.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                size: 46,
                color: Appcolors.success,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Workout Complete",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Another one in the books. Nice work.",
            style: TextStyle(color: Appcolors.muteText, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionLabel("WORKOUT NAME"),
        const SizedBox(height: 8),
        TextField(
          controller: _nameController,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          onChanged: (v) {
            if (_nameError && v.trim().isNotEmpty) {
              setState(() => _nameError = false);
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Appcolors.primaryColor,
            hintText: "Name this workout",
            hintStyle: const TextStyle(color: Appcolors.muteText),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: _nameError
                  ? const BorderSide(color: Appcolors.danger)
                  : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Appcolors.accent),
            ),
          ),
        ),
        if (_nameError) ...[
          const SizedBox(height: 6),
          const Text(
            "Give your workout a name to save it",
            style: TextStyle(color: Appcolors.danger, fontSize: 12),
          ),
        ],
      ],
    );
  }

  Widget _statGrid({
    required double totalVolume,
    required int totalSets,
    required int totalReps,
    required int completedExercises,
    required ({double weight, int reps})? topSet,
  }) {
    final tiles = <Widget>[
      _SummaryStat(
        icon: Icons.timer_outlined,
        color: Appcolors.accent,
        target: widget.elapsedSeconds.toDouble(),
        formatter: (v) => _clock(v.round()),
        label: "Duration",
      ),
      _SummaryStat(
        icon: Icons.fitness_center,
        color: Appcolors.info,
        target: totalVolume,
        formatter: (v) => formatCompactNumber(v),
        label: "Volume · lbs",
      ),
      _SummaryStat(
        icon: Icons.check_circle_outline,
        color: Appcolors.success,
        target: totalSets.toDouble(),
        formatter: (v) => "${v.round()}",
        label: "Sets",
      ),
      _SummaryStat(
        icon: Icons.repeat,
        color: Appcolors.info,
        target: totalReps.toDouble(),
        formatter: (v) => "${v.round()}",
        label: "Reps",
      ),
      _SummaryStat(
        icon: Icons.list_alt,
        color: Appcolors.accent,
        target: completedExercises.toDouble(),
        formatter: (v) => "${v.round()}",
        label: completedExercises == 1 ? "Exercise" : "Exercises",
      ),
      if (topSet != null)
        _SummaryStat(
          icon: Icons.trending_up,
          color: Appcolors.gold,
          target: topSet.weight,
          formatter: (v) =>
              "${formatDoubleNumber(v.round())}×${topSet.reps}",
          label: "Top Set",
        ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 10.0;
        final tileWidth = (constraints.maxWidth - spacing) / 2;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final tile in tiles)
              SizedBox(width: tileWidth, child: tile),
          ],
        );
      },
    );
  }

  Widget _exerciseRow(PerformedExerciseState exercise) {
    final completed = exercise.sets.where((s) => s.isCompleted).toList();
    if (completed.isEmpty) {
      return const SizedBox.shrink();
    }
    final top = completed.reduce(
      (a, b) => b.actWeight >= a.actWeight ? b : a,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Appcolors.secondaryColor,
            backgroundImage: AssetImage(exercise.imagePath),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              exercise.exerciseName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            "${completed.length} ${completed.length == 1 ? 'set' : 'sets'}",
            style: const TextStyle(color: Appcolors.muteText, fontSize: 12),
          ),
          const SizedBox(width: 12),
          Text(
            "${formatDoubleNumber(top.actWeight)} × ${top.actRep}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 14,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Appcolors.accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _bottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: const BoxDecoration(
        color: Appcolors.backgroundColor,
        border: Border(
          top: BorderSide(color: Appcolors.secondaryColor),
        ),
      ),
      child: Row(
        children: [
          TextButton(
            onPressed: _onDiscard,
            child: const Text(
              "Discard",
              style: TextStyle(
                color: Appcolors.danger,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Material(
              color: Appcolors.success,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: _onSave,
                child: Container(
                  height: 52,
                  alignment: Alignment.center,
                  child: const Text(
                    "Save Workout",
                    style: TextStyle(
                      color: Appcolors.backgroundColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _clock(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;
    final ss = seconds.toString().padLeft(2, '0');
    if (hours > 0) {
      return "$hours:${minutes.toString().padLeft(2, '0')}:$ss";
    }
    return "$minutes:$ss";
  }
}

/// A stat tile that counts up to its value when the summary appears.
class _SummaryStat extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double target;
  final String Function(double) formatter;
  final String label;

  const _SummaryStat({
    required this.icon,
    required this.color,
    required this.target,
    required this.formatter,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(height: 12),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: target),
            duration: const Duration(milliseconds: 650),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) => Text(
              formatter(value),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Appcolors.muteText, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
