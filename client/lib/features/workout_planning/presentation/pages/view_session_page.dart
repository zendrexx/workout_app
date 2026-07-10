import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/presentation/providers/session_detail_provider.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:client/features/workout_planning/presentation/widgets/view_session_workout_widget.dart';
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
        title: Text(
          "View Session",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: const Color(0xff0F0F0F),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: _editSession,
                child: const Icon(Icons.edit_outlined, color: Colors.white),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xff0F0F0F),
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

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                session.name.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Exercises",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white30,
                ),
              ),
              if (exercises.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Text(
                    "This session has no exercises.",
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    return ViewSessionWorkoutWidget(
                      title: exercise.exerciseName,
                      equipment: exercise.equipment,
                      imagePath: exercise.imagePath,
                      exerciseIndex: index,
                      plannedSets: exercise.sets,
                      notes: exercise.notes,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
