import 'package:flutter/material.dart';

class LogWorkoutDetailWidget extends StatelessWidget {
  final String title;
  final String? value;
  final Color? color;
  const LogWorkoutDetailWidget({
    super.key,
    required this.title,
    this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xff4E4E50),
              fontSize: 14,
            ),
          ),
          Text(
            value != null ? value! : "0",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: color ?? Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
