import 'package:flutter/material.dart';

class WorkoutRowWidget extends StatelessWidget {
  String imagePath;
  int sets;
  String exName;
  WorkoutRowWidget({
    super.key,
    required this.imagePath,
    required this.sets,
    required this.exName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(minRadius: 23, backgroundImage: AssetImage(imagePath)),
          SizedBox(width: 16),
          Text('$sets sets $exName'),
        ],
      ),
    );
  }
}
