import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:client/features/home/widgets/custom_button_widget.dart';
import 'package:client/features/home/widgets/home_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F0F0F),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: const Color(0xff0F0F0F),
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LongCustomButton(
                title: "CREATE WORKOUT SESSIONS",
                onTap: () => context.push('/home/program'),
                Bcolor: Color(0xff3B4141),
              ),
              SizedBox(height: 20),
              Text(
                "Program",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(title: "New Program", icon: Icons.add),
                  SizedBox(width: 10),
                  CustomButtonWidget(
                    title: "Explore",
                    icon: Icons.explore_outlined,
                  ),
                ],
              ),
              SizedBox(height: 20),
              HomeListWidget(),
              SizedBox(height: 20),
              HomeListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
