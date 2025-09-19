import 'package:flutter/material.dart';

class LongCustomButton extends StatelessWidget {
  const LongCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Expanded(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xffD3C061),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "Create Workout Session",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
