import 'package:client/core/constants/AppColors.dart';
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
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: isSelectable ? null : onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected
                ? Appcolors.accent.withValues(alpha: 0.12)
                : Appcolors.primaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? Appcolors.accent
                  : Colors.white.withValues(alpha: 0.04),
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Appcolors.secondaryColor,
                backgroundImage: AssetImage(imagePath),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      equipment != null ? "$name ($equipment)" : name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      primMuscle,
                      style: const TextStyle(
                        color: Appcolors.muteText,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelectable) ...[
                const SizedBox(width: 8),
                Container(
                  width: 22,
                  height: 22,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Appcolors.accent : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? Appcolors.accent
                          : Appcolors.muteText,
                      width: 1.5,
                    ),
                  ),
                  child: isSelected
                      ? const Icon(Icons.check, size: 14, color: Colors.black)
                      : null,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
