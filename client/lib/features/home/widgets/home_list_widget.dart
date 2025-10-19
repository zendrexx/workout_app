import 'package:client/core/notifier/planned_exercises_stream_provider.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/models/planned_exercise.dart';
import 'package:client/data/services/planned_session_service.dart';
import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeListWidget extends ConsumerWidget {
  final Function fOntap;
  final String title;
  final int id;
  HomeListWidget({
    super.key,
    required this.fOntap,
    required this.id,
    required this.title,
  });
  final sesService = PlannedSessionService();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plannedExerciseAsync = ref.watch(plannedExercisesStreamProvider(id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff3B4141)),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: () {
                        sesService.deleteSession(id);
                        print("tappedd");
                      },
                      padding: EdgeInsets.zero, // removes default padding
                      constraints: BoxConstraints(), // removes extra space
                      icon: Icon(Icons.delete, size: 20, color: Colors.white),
                    ),
                  ],
                ),

                plannedExerciseAsync.when(
                  data: (exercise) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: exercise.map((ex) {
                      final exerciseName =
                          ex.exercise.value?.name ?? 'Unnamed Exercise';
                      return Text(exerciseName);
                    }).toList(),
                  ),
                  error: (err, stack) => Text('Error: $err'),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
                SizedBox(height: 10),
                LongCustomButton(title: "Session", onTap: () => fOntap),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
