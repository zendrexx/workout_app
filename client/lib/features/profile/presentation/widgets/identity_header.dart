import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/profile/domain/entities/lifter_overview.dart';
import 'package:client/features/profile/presentation/utils/profile_formats.dart';
import 'package:flutter/material.dart';

/// Who this lifter is: monogram, name, bio and the body facts that anchor
/// every relative-strength number on the page.
class IdentityHeader extends StatelessWidget {
  final LifterOverview overview;
  final VoidCallback onEdit;

  const IdentityHeader({super.key, required this.overview, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    final profile = overview.profile;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Monogram(name: profile.displayName),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              GestureDetector(
                onTap: profile.hasDisplayName ? null : onEdit,
                child: profile.hasDisplayName
                    ? Text(
                        profile.displayName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : const Text(
                        "Name your lifter",
                        style: TextStyle(
                          color: Appcolors.muteText,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
              const SizedBox(height: 4),
              if (profile.hasBio)
                Text(
                  profile.bio,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Appcolors.muteText,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  _FactChip(
                    icon: Icons.monitor_weight_outlined,
                    label: formatWeight(profile.bodyWeightLbs, profile.unit),
                  ),
                  _FactChip(
                    icon: Icons.height,
                    label: formatHeight(profile.heightCm, profile.unit),
                  ),
                  if (overview.stats.firstWorkoutAt != null)
                    _FactChip(
                      icon: Icons.fitness_center,
                      label: _liftingSince(overview.stats.firstWorkoutAt!),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _liftingSince(DateTime first) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return "Lifting since ${months[first.month - 1]} ${first.year}";
  }
}

/// Elegant placeholder avatar: the lifter's initials once a name exists,
/// a barbell before then. A real picture can slot in later.
class _Monogram extends StatelessWidget {
  final String name;
  const _Monogram({required this.name});

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '';
    final first = parts.first[0];
    final last = parts.length > 1 ? parts.last[0] : '';
    return (first + last).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final initials = _initials;

    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Appcolors.accent.withValues(alpha: 0.15),
        border: Border.all(
          color: Appcolors.accent.withValues(alpha: 0.45),
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: initials.isEmpty
          ? const Icon(Icons.fitness_center, color: Appcolors.accent, size: 26)
          : Text(
              initials,
              style: const TextStyle(
                color: Appcolors.accent,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
    );
  }
}

class _FactChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FactChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Appcolors.muteText),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
