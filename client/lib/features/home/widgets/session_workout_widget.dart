import 'package:flutter/material.dart';

class SessionWorkoutWidget extends StatelessWidget {
  const SessionWorkoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            GestureDetector(child: Icon(Icons.more_vert_outlined)),
          ],
        ),
        TextField(
          decoration: InputDecoration(hintText: "Add session notes here"),
        ),
        Row(children: [Text("Sets"), Text("Prev"), Text("Sets"), Text("Reps")]),
      ],
    );
  }
}
