import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:flutter/material.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Programs",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xff4E4E50),
          ),
        ),

        SizedBox(height: 10),
        Container(
          height: 175,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff4E4A43)),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("PPL", style: TextStyle(fontSize: 16)),
                Text(
                  "Push day - Bench press, Machine fly..\nPull day - Lat PullDown, Pull ups, Row..\nLeg Day - Squat, Deadlift..",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 10),
                LongCustomButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
