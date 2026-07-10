import 'package:client/core/config/app_destination.dart';
import 'package:client/core/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final currentIndex = widget.navigationShell.currentIndex;

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Appcolors.backgroundColor,
          border: Border(
            top: BorderSide(color: Appcolors.secondaryColor, width: 1),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              tabs: appDestination
                  .map((d) => GButton(icon: d.icon, text: d.title))
                  .toList(),
              selectedIndex: currentIndex,
              onTabChange: (index) {
                widget.navigationShell.goBranch(
                  index,
                  // if reselecting the same tab, reset stack
                  initialLocation: index == currentIndex,
                );
              },
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              haptic: false,
              // No pill — the active tab is signalled by purple icon + label.
              tabBackgroundColor: Colors.transparent,
              rippleColor: Appcolors.accent.withValues(alpha: 0.08),
              hoverColor: Appcolors.accent.withValues(alpha: 0.06),
              backgroundColor: Appcolors.backgroundColor,
              color: Appcolors.muteText,
              activeColor: Appcolors.accent,
              iconSize: 22,
              gap: 6,
              textStyle: const TextStyle(
                color: Appcolors.accent,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
