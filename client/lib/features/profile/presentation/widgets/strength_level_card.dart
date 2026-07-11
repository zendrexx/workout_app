import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/profile/domain/entities/strength_level.dart';
import 'package:client/features/profile/domain/entities/weight_unit.dart';
import 'package:client/features/profile/presentation/utils/profile_formats.dart';
import 'package:flutter/material.dart';

/// The page's hero: the lifter's classification, why they earned it, and
/// the concrete lift that unlocks the next level. Everything is derived
/// from estimated one-rep maxes relative to bodyweight.
class StrengthLevelCard extends StatelessWidget {
  final StrengthAssessment assessment;
  final WeightUnit unit;

  const StrengthLevelCard({
    super.key,
    required this.assessment,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final levelColor = strengthLevelColor(assessment.level);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: levelColor.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "STRENGTH LEVEL",
                      style: TextStyle(
                        color: Appcolors.muteText,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      assessment.level.displayName,
                      style: TextStyle(
                        color: levelColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.military_tech, color: levelColor, size: 32),
            ],
          ),
          const SizedBox(height: 12),
          _LevelProgressBar(assessment: assessment),
          const SizedBox(height: 16),
          for (final lift in assessment.lifts) ...[
            _LiftStrengthRow(lift: lift),
            const SizedBox(height: 8),
          ],
          const SizedBox(height: 4),
          _NextStep(assessment: assessment, unit: unit),
          const SizedBox(height: 10),
          const Text(
            "Graded from your estimated one-rep maxes relative to "
            "bodyweight, against common barbell strength standards.",
            style: TextStyle(
              color: Appcolors.muteText,
              fontSize: 10,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

/// Progress from the current level toward the next, with both level names
/// anchoring the ends of the bar.
class _LevelProgressBar extends StatelessWidget {
  final StrengthAssessment assessment;
  const _LevelProgressBar({required this.assessment});

  @override
  Widget build(BuildContext context) {
    final next = assessment.level.next;
    final levelColor = strengthLevelColor(assessment.level);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: LinearProgressIndicator(
            value: assessment.progressToNext,
            minHeight: 6,
            backgroundColor: Appcolors.secondaryColor,
            valueColor: AlwaysStoppedAnimation(levelColor),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              assessment.level.displayName,
              style: TextStyle(
                color: levelColor,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (next != null)
              Text(
                "${(assessment.progressToNext * 100).round()}% to "
                "${next.displayName}",
                style: const TextStyle(
                  color: Appcolors.muteText,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              )
            else
              const Text(
                "Top of the standards",
                style: TextStyle(
                  color: Appcolors.gold,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _LiftStrengthRow extends StatelessWidget {
  final LiftStrength lift;
  const _LiftStrengthRow({required this.lift});

  @override
  Widget build(BuildContext context) {
    final color = strengthLevelColor(lift.level);

    return Row(
      children: [
        Expanded(
          child: Text(
            lift.lift.displayName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          formatRatio(lift.bodyweightRatio),
          style: const TextStyle(
            color: Appcolors.muteText,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 92,
          padding: const EdgeInsets.symmetric(vertical: 3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            lift.level.displayName.toUpperCase(),
            style: TextStyle(
              color: color,
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ],
    );
  }
}

/// The single most useful sentence on the page: which lift to push next
/// and exactly how much it needs.
class _NextStep extends StatelessWidget {
  final StrengthAssessment assessment;
  final WeightUnit unit;
  const _NextStep({required this.assessment, required this.unit});

  @override
  Widget build(BuildContext context) {
    final weakest = assessment.weakest;
    final target = weakest.lbsToNextLevel;
    final nextLevel = weakest.level.next;

    if (target == null || nextLevel == null) {
      return const SizedBox.shrink();
    }

    final message = assessment.missingLifts.isNotEmpty
        ? "Add a ${assessment.missingLifts.first.displayName} record to "
            "complete your assessment."
        : "+${formatWeight(target, unit)} on your "
            "${weakest.lift.displayName} reaches "
            "${nextLevel.displayName}.";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Appcolors.success.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const Icon(Icons.trending_up, size: 14, color: Appcolors.success),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Appcolors.success,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Shown instead of the card while there is nothing to grade: no fake
/// badge, just the two ways to earn one.
class StrengthLevelEmptyCard extends StatelessWidget {
  final VoidCallback onAddMaxes;

  const StrengthLevelEmptyCard({super.key, required this.onAddMaxes});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.military_tech, color: Appcolors.muteText, size: 20),
              SizedBox(width: 8),
              Text(
                "Not graded yet",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Your strength level is calculated from squat, bench and "
            "deadlift records relative to your bodyweight. Log a heavy set "
            "or enter your maxes to get placed on the standards.",
            style: TextStyle(
              color: Appcolors.muteText,
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: onAddMaxes,
            style: OutlinedButton.styleFrom(
              foregroundColor: Appcolors.accent,
              side: const BorderSide(color: Appcolors.accent),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: const Text("Enter your maxes"),
          ),
        ],
      ),
    );
  }
}
