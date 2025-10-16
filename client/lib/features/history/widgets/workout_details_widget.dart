import 'package:client/features/home/widgets/workout_set_widget.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsWidget extends StatelessWidget {
  const WorkoutDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                minRadius: 30,
                backgroundImage: AssetImage("assets/images/benchpress.png"),
              ),
              SizedBox(width: 16),
              Text(
                "Incline Bench Press (Barbell)",
                style: TextStyle(
                  color: Color(0xffD3C061),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Sobrang Bigat",
            style: TextStyle(color: Color(0xff4E4E50), fontSize: 14),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Text(
                  "SETS",
                  style: TextStyle(fontSize: 14, color: Color(0xff4E4E50)),
                ),
              ),
              Expanded(
                child: Text(
                  "LBS",
                  style: TextStyle(fontSize: 14, color: Color(0xff4E4E50)),
                ),
              ),
              Expanded(
                child: FittedBox(
                  child: Text(
                    "REP RANGE",
                    style: TextStyle(fontSize: 14, color: Color(0xff4E4E50)),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          // WorkoutSetWidget(),

          // WorkoutSetWidget(),
          // WorkoutSetWidget(),
        ],
      ),
    );
  }
}
