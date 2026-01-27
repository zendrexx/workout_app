import 'package:client/core/utils/format_number.dart';
import 'package:client/core/utils/seconds_to_string.dart';
import 'package:client/core/utils/time_ago.dart';
import 'package:client/features/history/presentation/widgets/workout_row_widget.dart';
import 'package:client/features/workout_logging/domain/entities/performed_session.dart';
import 'package:client/features/workout_logging/presentation/state/performed_exercise_state.dart';
import 'package:client/features/workout_logging/presentation/state/performed_session_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryWorkoutContainerWidget extends StatefulWidget {
  PerformedSessionState session;
  int index;
  // DateTime endTime;
  // String title;
  // String time;
  // String totalVolume;
  // String totalSets;
  // int totalPerformedEx;
  // String sessionId;
  //List<PerformedExerciseState> exercises;
  HistoryWorkoutContainerWidget({
    super.key,
    required this.session,
    required this.index,
    // required this.endTime,
    // required this.title,
    // required this.time,
    // required this.totalVolume,
    // required this.exercises,
    // required this.totalSets,
    // required this.totalPerformedEx,
    // required this.sessionId,
  });

  @override
  State<HistoryWorkoutContainerWidget> createState() =>
      _HistoryWorkoutContainerWidgetState();
}

class _HistoryWorkoutContainerWidgetState
    extends State<HistoryWorkoutContainerWidget> {
  late String seeMoreExercises;
  @override
  void initState() {
    super.initState();
    seeMoreExercises = widget.session.performedExercise.length > 3
        ? "See ${widget.session.performedExercise.length - 3} more exercises"
        : "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: GestureDetector(
        onTap: () => context.push("/history/view_history${widget.index}"),
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
                  widget.session.name,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1,
                    color: Color(0xffE2725B),
                  ),
                ),
                Text(
                  timeAgo(widget.session.endTime),
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
                        Text(
                          secondsToString(
                            widget.session.performedStats.totalSeconds,
                          ),
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
                          "${formatNumber(widget.session.performedStats.totalVolume)} lbs",
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
                        Text(
                          widget.session.performedStats.totalSets.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.session.performedExercise.length,
                  itemBuilder: (context, index) {
                    final exercise = widget.session.performedExercise[index];
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
                    onTap: () {},
                    child: widget.session.performedExercise.length <= 3
                        ? SizedBox.shrink()
                        : Text(
                            seeMoreExercises,
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
      ),
    );
  }
}
