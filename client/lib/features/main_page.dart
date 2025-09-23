import 'package:client/features/history/history_page.dart';
import 'package:client/features/home/home_page.dart';
import 'package:client/features/profile/profile_page.dart';
import 'package:client/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 1;

  final List<Widget> pages = const [HistoryPage(), HomePage(), ProfilePage()];

  final List<IconData> icons = [
    Icons.history,
    Icons.circle_outlined,
    Icons.person,
  ];

  final List<String> labels = ["History", "Home", "ZHEVION"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141316),
      appBar: AppBar(
        title: Text(
          labels[currentPage],
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Color(0xFF141316),
      ),
      body: pages[currentPage],
      bottomNavigationBar: Container(
        color: const Color(0xff1e1c20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          child: GNav(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            tabs: [
              GButton(icon: Icons.history, text: "History"),
              GButton(icon: Icons.circle_outlined, text: "Home"),
              GButton(icon: Icons.person, text: "Profile"),
            ],
            selectedIndex: currentPage,
            onTabChange: (index) {
              setState(() {
                currentPage = index;
              });
            },
            padding: EdgeInsetsGeometry.all(16),
            haptic: false,
            tabBackgroundColor: const Color(0xff292E28),
            backgroundColor: const Color(0xff1e1c20),
            color: Colors.white,
            activeColor: Color(0xffEDA938),
            gap: 8,
          ),
        ),
      ),
    );
  }
}
