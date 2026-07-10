import 'package:client/core/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shown when the user has no workout history yet.
class HistoryEmptyState extends StatelessWidget {
  const HistoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Appcolors.accent.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.fitness_center,
                size: 28,
                color: Appcolors.accent,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "No workouts yet",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Every workout you finish is recorded here.\nYour first one starts the timeline.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Appcolors.muteText,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => context.push('/home/log_workout'),
              child: Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  color: Appcolors.accent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    "Start Training",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
