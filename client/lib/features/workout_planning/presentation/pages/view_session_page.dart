import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/presentation/providers/session_detail_provider.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:client/features/workout_planning/presentation/widgets/view_exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ViewSessionPage extends ConsumerStatefulWidget {
  final String sessionId;
  const ViewSessionPage({super.key, required this.sessionId});

  @override
  ConsumerState<ViewSessionPage> createState() => _ViewSessionPageState();
}

class _ViewSessionPageState extends ConsumerState<ViewSessionPage> {
  Future<void> _editSession() async {
    await context.push('/home/create_sessions?sessionId=${widget.sessionId}');
    // The session may have been edited; refetch so this page reflects it.
    if (mounted) ref.invalidate(sessionDetailProvider(widget.sessionId));
  }

  @override
  Widget build(BuildContext context) {
    final sessionAsync = ref.watch(sessionDetailProvider(widget.sessionId));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "View Session",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: Appcolors.backgroundColor,
        actions: [
          TextButton.icon(
            onPressed: _editSession,
            icon: const Icon(Icons.edit_outlined, color: Appcolors.accent, size: 18),
            label: const Text(
              "Edit",
              style: TextStyle(color: Appcolors.accent, fontSize: 14),
            ),
          ),
          const SizedBox(width: 8),
        ],
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Appcolors.backgroundColor,
      body: sessionAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Couldn't load this session.\n$error",
              style: const TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        data: (session) => _SessionDetail(session: session),
      ),
    );
  }
}

class _SessionDetail extends StatelessWidget {
  final PlannedWorkoutSession session;
  const _SessionDetail({required this.session});

  @override
  Widget build(BuildContext context) {
    final exercises = session.exercises.map(toStateExercise).toList();
    final totalSets = exercises.fold<int>(0, (sum, e) => sum + e.sets.length);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              session.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${exercises.length} exercises • $totalSets sets",
              style: const TextStyle(fontSize: 13, color: Appcolors.muteText),
            ),
            const SizedBox(height: 16),
            if (exercises.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.fitness_center_rounded,
                        color: Appcolors.muteText,
                        size: 32,
                      ),
                      SizedBox(height: 12),
                      Text(
                        "This session has no exercises.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              ...exercises.map(
                (exercise) => ViewExerciseCard(
                  title: exercise.exerciseName,
                  equipment: exercise.equipment,
                  imagePath: exercise.imagePath,
                  plannedSets: exercise.sets,
                  notes: exercise.notes,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
