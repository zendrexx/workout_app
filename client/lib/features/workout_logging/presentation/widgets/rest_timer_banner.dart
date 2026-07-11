import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_logging/presentation/providers/rest_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Between-sets rest countdown. Collapses to nothing when no rest is running,
/// so it costs zero space during active lifting and slides in only after a set
/// is completed. Orange = momentum, matching the rest-timer semantics.
class RestTimerBanner extends ConsumerStatefulWidget {
  const RestTimerBanner({super.key});

  @override
  ConsumerState<RestTimerBanner> createState() => _RestTimerBannerState();
}

class _RestTimerBannerState extends ConsumerState<RestTimerBanner> {
  @override
  Widget build(BuildContext context) {
    // A light tick when a running rest naturally reaches zero.
    ref.listen<RestTimerState>(restTimerProvider, (prev, next) {
      if ((prev?.isActive ?? false) &&
          !next.isActive &&
          next.remaining == 0) {
        HapticFeedback.mediumImpact();
      }
    });

    final rest = ref.watch(restTimerProvider);
    final notifier = ref.read(restTimerProvider.notifier);

    return AnimatedSize(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      alignment: Alignment.topCenter,
      child: !rest.isActive
          ? const SizedBox(width: double.infinity)
          : Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: Appcolors.momentum.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Appcolors.momentum.withValues(alpha: 0.35),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.timer_outlined,
                          size: 18,
                          color: Appcolors.momentum,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "REST",
                          style: TextStyle(
                            color: Appcolors.momentum,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _clock(rest.remaining),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        _pillButton("-15", () => notifier.add(-15)),
                        const SizedBox(width: 6),
                        _pillButton("+15", () => notifier.add(15)),
                        const SizedBox(width: 6),
                        _pillButton("Skip", notifier.skip, filled: true),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        value: rest.progress,
                        minHeight: 4,
                        backgroundColor:
                            Appcolors.momentum.withValues(alpha: 0.15),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Appcolors.momentum,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _pillButton(String label, VoidCallback onTap, {bool filled = false}) {
    return Material(
      color: filled
          ? Appcolors.momentum.withValues(alpha: 0.25)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Appcolors.momentum.withValues(alpha: 0.5),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Appcolors.momentum,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  String _clock(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }
}
