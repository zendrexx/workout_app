import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';
import 'package:client/features/workout_program/domain/entities/program_session.dart';
import 'package:client/features/workout_program/presentation/providers/today_workout_provider.dart';
import 'package:client/features/workout_program/presentation/state/today_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeProgramCard extends ConsumerWidget {
  const HomeProgramCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayAsync = ref.watch(todayWorkoutProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: todayAsync.when(
        loading: () => const SizedBox(
          height: 120,
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (e, _) => SizedBox(
          height: 120,
          child: Center(
            child: Text(
              'Could not load program',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        data: (today) => _buildContent(context, today),
      ),
    );
  }

  Widget _buildContent(BuildContext context, TodayWorkout today) {
    switch (today.status) {
      case TodayStatus.none:
        return _MessageBlock(
          title: "No Active Program",
          subtitle: "Start a program to see your daily workouts here.",
        );

      case TodayStatus.completed:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(programName: today.program?.name ?? "Program"),
            const SizedBox(height: 12),
            _MessageBlock(
              title: "🎉 Program Complete!",
              subtitle: "You finished every week. Great work.",
            ),
            const SizedBox(height: 12),
            _ViewProgramButton(programId: today.program?.programId),
          ],
        );

      case TodayStatus.rest:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              programName: today.program?.name ?? "Program",
              subtitle: "Week ${today.week} • Day ${today.day}",
            ),
            const SizedBox(height: 12),
            _MessageBlock(
              title: "😴 Rest Day",
              subtitle: today.hasNextWorkout
                  ? "Next up: ${today.nextSession!.name} (Week ${today.nextWeek} • Day ${today.nextDay})"
                  : "Enjoy your recovery.",
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                if (today.hasNextWorkout)
                  Expanded(
                    child: _StartWorkoutButton(
                      programId: today.program!.programId,
                      week: today.nextWeek!,
                      day: today.nextDay!,
                      label: "Start Next Workout",
                    ),
                  ),
                if (today.hasNextWorkout) const SizedBox(width: 8),
                _ViewProgramButton(programId: today.program?.programId),
              ],
            ),
          ],
        );

      case TodayStatus.workout:
        final session = today.todaySession!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              programName: today.program?.name ?? "Program",
              subtitle: "Week ${today.week} • Day ${today.day}",
            ),
            const SizedBox(height: 12),
            Text(
              session.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            _ExercisePreview(session: session),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _StartWorkoutButton(
                    programId: today.program!.programId,
                    week: today.week,
                    day: today.day,
                    label: "Start Workout",
                  ),
                ),
                const SizedBox(width: 8),
                _ViewProgramButton(programId: today.program?.programId),
              ],
            ),
          ],
        );
    }
  }
}

class _Header extends StatelessWidget {
  final String programName;
  final String? subtitle;
  const _Header({required this.programName, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/program_pic.png', width: 48, height: 48),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                programName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Appcolors.muteText,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExercisePreview extends StatelessWidget {
  final ProgramSession session;
  const _ExercisePreview({required this.session});

  /// Sets x reps, e.g. "5x3" or "3x8-10".
  String _setsLabel(PlannedWorkoutExercise e) {
    if (e.sets.isEmpty) return "-";
    final first = e.sets.first;
    final reps = first.minRep == first.maxRep
        ? "${first.minRep}"
        : "${first.minRep}-${first.maxRep}";
    return "${e.sets.length}x$reps";
  }

  @override
  Widget build(BuildContext context) {
    const headerStyle = TextStyle(fontSize: 13, color: Appcolors.muteText);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Expanded(flex: 3, child: Text("Exercise", style: headerStyle)),
            Expanded(flex: 2, child: Text("Sets", style: headerStyle)),
            Expanded(
              flex: 1,
              child: Text("RPE", textAlign: TextAlign.end, style: headerStyle),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ...session.exercises.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    e.exerciseName,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    _setsLabel(e),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    // RPE is not tracked in the set model yet.
                    "-",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Appcolors.muteText,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _StartWorkoutButton extends StatelessWidget {
  final String programId;
  final int week;
  final int day;
  final String label;
  const _StartWorkoutButton({
    required this.programId,
    required this.week,
    required this.day,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        '/home/log_workout?programId=$programId&week=$week&day=$day',
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Appcolors.accent,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 45,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class _ViewProgramButton extends StatelessWidget {
  final String? programId;
  const _ViewProgramButton({required this.programId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: programId == null
          ? null
          : () => context.push('/home/view_program/$programId'),
      child: Container(
        decoration: BoxDecoration(
          color: Appcolors.secondaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Center(
          child: Text(
            "View Program",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class _MessageBlock extends StatelessWidget {
  final String title;
  final String subtitle;
  const _MessageBlock({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14, color: Appcolors.muteText),
        ),
      ],
    );
  }
}
