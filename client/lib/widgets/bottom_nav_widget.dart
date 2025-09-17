import 'package:flutter/material.dart';

class BottomNavHandler extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const BottomNavHandler({
    super.key,
    required this.isActive,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubicEmphasized,
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: isActive ? 12 : 0),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xff292E28) : Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // <-- auto-shrink to content
              children: [
                Icon(
                  icon,
                  color: isActive ? const Color(0xffEDA938) : Colors.white,
                  size: 28,
                ),
                if (isActive) ...[
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: const TextStyle(
                      color: Color(0xffEDA938),
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
