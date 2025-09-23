import 'package:flutter/material.dart';

class PrCardWidget extends StatelessWidget {
  final String title, value;
  final Color color;
  final String iconPath;

  const PrCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Image.asset(iconPath, width: 20, height: 20),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xffA6A6A6),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
