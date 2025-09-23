import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:client/features/home/widgets/custom_button_widget.dart';
import 'package:client/features/home/widgets/home_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LongCustomButton(title: "CREATE WORKOUT SESSIONS"),
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
    );
  }
}
