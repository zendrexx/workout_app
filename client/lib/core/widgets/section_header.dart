import 'package:client/core/constants/AppColors.dart';
import 'package:flutter/material.dart';

/// A small, consistent section label used to give pages a clear rhythm:
/// a short accent bar followed by an uppercase, letter-spaced title.
///
/// Mirrors the visual language already established on the History page so
/// the app reads as one product rather than a set of unrelated screens.
class SectionHeader extends StatelessWidget {
  final String title;
  final String? trailingText;

  /// Optional widget pinned to the right of the header (e.g. an info tooltip).
  /// Takes precedence over [trailingText] when both are supplied.
  final Widget? trailing;

  const SectionHeader({
    super.key,
    required this.title,
    this.trailingText,
    this.trailing,
  });

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
        if (trailing != null)
          trailing!
        else if (trailingText != null)
          Text(
            trailingText!,
            style: const TextStyle(color: Appcolors.muteText, fontSize: 11),
          ),
      ],
    );
  }
}
