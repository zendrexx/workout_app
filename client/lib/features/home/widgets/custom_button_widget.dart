import 'package:flutter/material.dart';

class CustomButtonWidget extends StatefulWidget {
  final String title;
  final IconData icon;
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xff4E4A43),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, color: Colors.white),
            SizedBox(width: 8),
            Text(
              widget.title,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
