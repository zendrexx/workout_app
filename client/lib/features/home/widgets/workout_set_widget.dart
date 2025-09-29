import 'package:flutter/material.dart';

class WorkoutSetWidget extends StatelessWidget {
  const WorkoutSetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: const Row(
        children: [
          Expanded(child: Text("1", style: TextStyle(fontSize: 18))),
          Expanded(
            child: Text(
              "-",
              style: TextStyle(fontSize: 18, color: Color(0xff4E4E50)),
            ),
          ),
          Expanded(child: Text("10-12", style: TextStyle(fontSize: 18))),
          Spacer(),
        ],
      ),
    );
  }
}
