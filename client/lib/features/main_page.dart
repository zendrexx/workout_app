import 'package:client/features/history/history_page.dart';
import 'package:client/features/home/home_page.dart';
import 'package:client/features/profile/profile_page.dart';
import 'package:client/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';

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

  final List<String> labels = ["History", "Home", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141316),
      appBar: AppBar(title: Text(labels[currentPage])),
      body: pages[currentPage],
      bottomNavigationBar: BottomAppBar(
        shadowColor: const Color(0xffEDA938),
        elevation: 50,
        color: const Color(0xff141316),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
            (index) => BottomNavHandler(
              isActive: currentPage == index,
              icon: icons[index],
              label: labels[index],
              onTap: () {
                setState(() => currentPage = index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
