import 'package:client/features/history/widgets/workout_row_widget.dart';
import 'package:client/features/home/widgets/workout_set_widget.dart';
import 'package:flutter/material.dart';

class SessionWorkoutWidget extends StatelessWidget {
  const SessionWorkoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/benchpress.png"),
              ),
              SizedBox(width: 5),
              Text(
                "Incline Bench Press (Barbell)",
                style: TextStyle(
                  color: Color(0xffE2725B),
                  fontSize: 16,
                  wordSpacing: .5,
                ),
              ),
              Spacer(),
              GestureDetector(
                child: Icon(Icons.more_vert_outlined, color: Colors.white),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Add session notes here",
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 14),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Sets",
                  style: TextStyle(fontSize: 14, color: Color(0xff4E4E50)),
                ),
              ),
              Expanded(
                child: Text(
                  "Lbs",
                  style: TextStyle(fontSize: 14, color: Color(0xff4E4E50)),
                ),
              ),
              Expanded(
                child: Text(
                  "Rep Range",
                  style: TextStyle(fontSize: 14, color: Color(0xff4E4E50)),
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 5),
          WorkoutSetWidget(),
          WorkoutSetWidget(),
          WorkoutSetWidget(),
        ],
      ),
    );
  }
}
