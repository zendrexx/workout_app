import 'package:client/core/utils/time_ago.dart';
import 'package:client/features/history/presentation/widgets/workout_row_widget.dart';
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryWorkoutContainerWidget extends StatefulWidget {
  DateTime endTime;
  String title;
  String time;
  String totalVolume;
  String totalSets;
  List<PerformedExerciseState> exercises;
  HistoryWorkoutContainerWidget({
    super.key,
    required this.endTime,
    required this.title,
    required this.time,
    required this.totalVolume,
    required this.exercises,
    required this.totalSets,
  });

  @override
  State<HistoryWorkoutContainerWidget> createState() =>
      _HistoryWorkoutContainerWidgetState();
}

class _HistoryWorkoutContainerWidgetState
    extends State<HistoryWorkoutContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Color(0xff3B4141)),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  height: 1,
                  color: Color(0xffE2725B),
                ),
              ),
              Text(
                timeAgo(widget.endTime),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Color(0xff2F4F4F),
                ),
              ),
              SizedBox(height: 10),
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
                      Text(widget.time),
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
                      Text(widget.totalVolume),
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
                      Text(widget.totalSets),
                    ],
                  ),
                ],
              ),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.exercises.length,
                itemBuilder: (context, index) {
                  final exercise = widget.exercises[index];
                  print("IS IT COMPLETE");
                  print(exercise.sets[0].isCompleted);
                  return WorkoutRowWidget(
                    imagePath: exercise.imagePath,
                    sets: exercise.completedSetsCount,
                    exName: exercise.exerciseName,
                  );
                },
              ),

              SizedBox(height: 15),
              Center(
                child: GestureDetector(
                  onTap: () => context.push("/history/view_history"),
                  child: Text(
                    "See 4 more exercises",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Color(0xff89898A),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
