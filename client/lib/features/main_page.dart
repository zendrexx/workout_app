import 'package:client/core/config/app_destination.dart';
import 'package:client/features/history/pages/history_page.dart';
import 'package:client/features/home/pages/home_page.dart';
import 'package:client/features/profile/pages/profile_page.dart';
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
        decoration: BoxDecoration(
          color: const Color(0xff0F0F0F),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              blurRadius: 8, // How soft the shadow is
              spreadRadius: 2, // How wide the shadow spreads
              offset: const Offset(0, -4), // Move shadow UP (negative Y)
            ),
          ],
        ),

        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
          padding: const EdgeInsets.all(16),
          haptic: false,
          tabBackgroundColor: const Color(0xff2F4F4F),
          backgroundColor: const Color(0xff0F0F0F),
          color: Colors.white,
          activeColor: const Color(0xffEAE0C8),
          gap: 8,
        ),
      ),
    );
  }
}
