import 'package:client/core/utils/format_number.dart';
import 'package:client/core/utils/seconds_to_string.dart';
import 'package:client/core/utils/time_ago.dart';
import 'package:client/features/history/presentation/providers/history_view_model_provider.dart';
import 'package:client/features/history/presentation/widgets/workout_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewHistoryPage extends ConsumerWidget {
  final int index;
  const ViewHistoryPage({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(historyViewModelProvider);
    final session = state.psession[index];
    return Scaffold(
      backgroundColor: Color(0xff0F0F0F),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "History",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: const Color(0xff0F0F0F),
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                session.name,
                style: TextStyle(
                  fontSize: 22,
                  height: 1,
                  color: Color(0xffE2725B),
                ),
              ),
              Text(
                timeAgo(session.endTime),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Color(0xff2F4F4F),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: Color(0xff89898A),
                        ),
                      ),
                      Text(
                        secondsToString(session.performedStats.totalSeconds),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Volume",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: Color(0xff89898A),
                        ),
                      ),
                      Text(
                        formatDoubleNumber(session.performedStats.totalVolume),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sets",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: Color(0xff89898A),
                        ),
                      ),
                      Text(session.performedStats.totalSets.toString()),
                    ],
                  ),
                ],
              ),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: session.performedExercise.length,
                itemBuilder: (context, index) {
                  final exercise = session.performedExercise[index];

                  return WorkoutDetailsWidget(
                    name: exercise.exerciseName,
                    imagePath: exercise.imagePath,
                    notes: exercise.notes,
                    sets: exercise.sets,
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
