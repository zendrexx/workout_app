import 'package:client/features/profile/widgets/heatmap_widget.dart';
import 'package:client/features/profile/widgets/pr_card_widget.dart';
import 'package:client/features/profile/widgets/stat_card_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F0F0F),
      appBar: AppBar(
        title: Text(
          "ZHEVION",
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),

            // Profile Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Zendrex Adversalo",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'edit') {
                                // handle edit profile action
                              } else if (value == 'share') {
                                // handle share profile action
                              }
                            },
                            itemBuilder: (BuildContext context) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Text("Edit Profile"),
                              ),
                              const PopupMenuItem(
                                value: 'share',
                                child: Text("Share Profile"),
                              ),
                            ],
                            child: const Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "@zen",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "The body achieves what the mind believes",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Stats
            const SizedBox(height: 10),
            const Text("STATS", style: TextStyle(color: Colors.grey)),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),
            Row(
              children: const [
                Expanded(
                  child: StatCardWidget(
                    title: "TOTAL VOLUME",
                    value: "38,000lbs",
                    imagePath: "assets/images/volume.png",
                  ),
                ),
                Expanded(
                  child: StatCardWidget(
                    title: "TOTAL SETS",
                    value: "73",
                    imagePath: "assets/images/totalSets.png",
                  ),
                ),
                Expanded(
                  child: StatCardWidget(
                    title: "DAY STREAK",
                    value: "8",
                    imagePath: "assets/images/streakBw.png",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Calendar Heatmap placeholder
            Text(
              "135 Days of working out",
              style: TextStyle(color: Color(0xff8F8F8F), fontSize: 12),
            ),
            SizedBox(height: 5),
            HeatmapWidget(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Color(0xff132020),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(width: 6),
                Text("Less"),
                SizedBox(width: 10),
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Color(0xff2F4F4F),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(width: 6),
                Text("More"),
              ],
            ),
            const SizedBox(height: 30),

            // Personal Records
            const Text(
              "PERSONAL RECORDS",
              style: TextStyle(color: Colors.grey),
            ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        "Leaderboards",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: 0.78,
                            strokeWidth: 8,
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation(Colors.green),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "TOP 22%",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "In Weight Class",
                        style: TextStyle(
                          color: Color(0xff494949),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: PrCardWidget(
                        color: Colors.orange,
                        title: "Squat",
                        value: "280lbs",
                        iconPath: "assets/images/squat.png",
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: PrCardWidget(
                        color: Colors.green,
                        title: "Bench",
                        value: "150lbs",
                        iconPath: "assets/images/bench.png",
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: PrCardWidget(
                        color: Colors.blue,
                        title: "Deadlift",
                        value: "350lbs",
                        iconPath: "assets/images/deadlift.png",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
