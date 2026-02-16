import 'package:flutter/material.dart';

class StatCardWidget extends StatelessWidget {
  final String title, value;
  final String imagePath;
  const StatCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff1A1919),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset(imagePath, height: 30, width: 30),
              SizedBox(height: 10),
              Text(
                "$title",
                style: const TextStyle(color: Color(0xffEAE0C8), fontSize: 10),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
