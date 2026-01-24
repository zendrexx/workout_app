import 'package:flutter/material.dart';

class WorkoutRowWidget extends StatelessWidget {
  const WorkoutRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            minRadius: 23,
            backgroundImage: AssetImage("assets/images/benchpress.png"),
          ),
          SizedBox(width: 16),
          Text("3 sets Incline Bench Press.."),
        ],
      ),
    );
  }
}
