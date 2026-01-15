import 'package:flutter/material.dart';

class StreakWidget extends StatelessWidget {
  final int count;
  const StreakWidget({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // The Flame Icon
        Icon(
          Icons.whatshot, // This is the standard "whatshot" icon in Flutter
          size: 50.0, // Adjust the size as needed
          color: Colors.orange, // The primary flame color
        ),
        // The Number (28 in your example)
        Text(
          count.toString(),
          style: const TextStyle(
            color: Colors.white, // The number color
            fontSize: 18.0, // Adjust the font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
