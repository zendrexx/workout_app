import 'package:client/core/config/app_destination.dart';
import 'package:client/features/history/history_page.dart';
import 'package:client/features/home/home_page.dart';
import 'package:client/features/profile/profile_page.dart';
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
  final List<String> labels = ["History", "Home", "ZHEVION"];

  @override
  Widget build(BuildContext context) {
    final currentIndex = widget.navigationShell.currentIndex;

    return Scaffold(
      backgroundColor: const Color(0xff141316),
      appBar: AppBar(
        title: Text(
          labels[currentIndex],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: const Color(0xFF141316),
      ),
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        color: const Color(0xff1e1c20),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
            //setState(() {});
          },
          padding: const EdgeInsets.all(16),
          haptic: false,
          tabBackgroundColor: const Color(0xff292E28),
          backgroundColor: const Color(0xff1e1c20),
          color: Colors.white,
          activeColor: const Color(0xffEDA938),
          gap: 8,
        ),
      ),
    );
  }
}
