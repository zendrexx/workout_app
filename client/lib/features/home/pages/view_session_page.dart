import 'package:client/core/notifier/planned_exercises_stream_provider.dart';
import 'package:client/core/notifier/planned_session_stream_provider.dart';
import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:client/data/services/planned_session_service.dart';
import 'package:client/features/home/widgets/session_workout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewSessionPage extends ConsumerWidget {
  final sesService = PlannedSessionService();
  final int id;
  ViewSessionPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plannedSessionsAsync = ref.watch(plannedSessionStreamProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Create Sessions",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: const Color(0xff0F0F0F),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(onTap: () {}, child: Icon(Icons.more_horiz)),
              SizedBox(width: 16),
            ],
          ),
        ],
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff0F0F0F),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              plannedSessionsAsync.when(
                data: (sessions) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sessions.length,
                    itemBuilder: (context, index) {
                      final session = sessions[index];
                      final exercises = session.plannedExercise.toList();
                      () async {}();
                      return SessionWorkoutWidget(
                        title: exercises[index].exerciseName ?? '',
                        equipment: exercises[index].equipment ?? '',
                        imagePath: exercises[index].exercisePath ?? '',
                        index: index,
                        id: exercises[index].id,
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Text(
                  'Error: $err',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
