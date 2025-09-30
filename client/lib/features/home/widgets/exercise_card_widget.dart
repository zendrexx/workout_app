import 'package:flutter/material.dart';

class ExerciseCardWidget extends StatelessWidget {
  final bool isSelectable;
  final bool isSelected;
  final VoidCallback? onTap;
  const ExerciseCardWidget({
    super.key,
    this.isSelectable = false,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: GestureDetector(
        onTap: isSelectable ? null : onTap,
        child: Container(
          decoration: BoxDecoration(),
          width: double.infinity,
          height: 70,
          child: Column(
            children: [
              Row(
                children: [
                  if (isSelected) ...[
                    Container(
                      height: 40,
                      width: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xffE2725B),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/benchpress.png"),
                  ),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Incline Bench Press (Barbell)",
                        style: TextStyle(
                          fontSize: 16,
                          wordSpacing: .5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Upper Chest",
                        style: TextStyle(
                          color: Color(0xff919596),
                          fontSize: 12,
                          wordSpacing: .5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5),
            ],
          ),
        ),
      ),
    );
  }
}
