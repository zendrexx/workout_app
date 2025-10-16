import 'package:flutter/material.dart';

class WorkoutSetWidget extends StatelessWidget {
  final String setNum;
  const WorkoutSetWidget({super.key, required this.setNum});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Expanded(child: Text(setNum, style: TextStyle(fontSize: 14))),
          Expanded(
            child: Text(
              "-",
              style: TextStyle(fontSize: 18, color: Color(0xff4E4E50)),
            ),
          ),
          Expanded(child: Text("0", style: TextStyle(fontSize: 14))),
          Spacer(),
        ],
      ),
    );
  }
}
