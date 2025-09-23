import 'package:flutter/material.dart';

class LongCustomButton extends StatelessWidget {
  final String title;
  const LongCustomButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Color(0xffD3C061),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
