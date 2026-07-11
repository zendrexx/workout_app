import 'package:client/core/constants/AppColors.dart';
import 'package:flutter/material.dart';

/// Section label with the app's accent tick — same visual grammar as the
/// History page so the tabs feel like one product.
class ProfileSectionHeader extends StatelessWidget {
  final String title;
  final String? trailingText;

  const ProfileSectionHeader({super.key, required this.title, this.trailingText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 14,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Appcolors.accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const Spacer(),
        if (trailingText != null)
          Text(
            trailingText!,
            style: const TextStyle(color: Appcolors.muteText, fontSize: 11),
          ),
      ],
    );
  }
}
