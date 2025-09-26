import 'package:flutter/material.dart';

class LongCustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData? icon;
  const LongCustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Color(0xff2F4F4F),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
