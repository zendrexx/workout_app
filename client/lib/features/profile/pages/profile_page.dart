import 'package:client/features/profile/widgets/heatmap_widget.dart';
import 'package:client/features/profile/widgets/pr_card_widget.dart';
import 'package:client/features/profile/widgets/stat_row_widget.dart';
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
            Column(
              children: const [
                StatRowWidget(title: "TOTAL VOLUME", value: "38,000lbs"),
                StatRowWidget(title: "TOTAL SETS", value: "73"),
                StatRowWidget(title: "WEEK STREAK", value: "10"),
              ],
            ),
            const SizedBox(height: 20),

            // Calendar Heatmap placeholder
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
            const SizedBox(height: 20),

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
                Column(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Stronger Than",
                              style: TextStyle(color: Color(0xffEDA938)),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: CircularProgressIndicator(
                                  value: 0.78,
                                  strokeWidth: 8,
                                  backgroundColor: Colors.grey,
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.green,
                                  ),
                                ),
                              ),
                              Text(
                                "78%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/gold_badge.png",
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Gold Rank",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
