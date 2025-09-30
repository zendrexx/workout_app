import 'package:client/features/history/widgets/workout_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryWorkoutContainerWidget extends StatefulWidget {
  const HistoryWorkoutContainerWidget({super.key});

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
                "PUSH DAY",
                style: TextStyle(
                  fontSize: 18,
                  height: 1,
                  color: Color(0xffE2725B),
                ),
              ),
              Text(
                "12 mins ago",
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
                      Text("1h 10min"),
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
                      Text("10,002.1 lbs"),
                    ],
                  ),
                ],
              ),
              Divider(),
              WorkoutRowWidget(),
              WorkoutRowWidget(),
              WorkoutRowWidget(),
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
