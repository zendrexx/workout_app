import 'package:client/features/history/widgets/workout_details_widget.dart';
import 'package:client/features/history/widgets/workout_row_widget.dart';
import 'package:flutter/material.dart';

class ViewHistoryPage extends StatelessWidget {
  const ViewHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                "PUSH DAY",
                style: TextStyle(
                  fontSize: 22,
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
              WorkoutDetailsWidget(),
              WorkoutDetailsWidget(),
              WorkoutDetailsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
