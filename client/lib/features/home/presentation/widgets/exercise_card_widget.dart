import 'package:flutter/material.dart';

class ExerciseCardWidget extends StatelessWidget {
  final bool isSelectable;
  final bool isSelected;
  final VoidCallback? onTap;
  final String name;
  final String imagePath;
  final String primMuscle;
  final String? equipment;
  const ExerciseCardWidget({
    super.key,
    this.isSelectable = false,
    this.isSelected = false,
    this.onTap,
    required this.name,
    required this.imagePath,
    required this.primMuscle,
    this.equipment,
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
          height: 80,
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
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(imagePath),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        equipment != null ? "$name ($equipment)" : name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        primMuscle,
                        style: TextStyle(
                          color: Color(0xff919596),
                          fontSize: 12,
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
