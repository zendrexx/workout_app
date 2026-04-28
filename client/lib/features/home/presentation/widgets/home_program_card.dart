import 'dart:math';

import 'package:client/core/constants/AppColors.dart';
import 'package:flutter/material.dart';

class HomeProgramCard extends StatelessWidget {
  const HomeProgramCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/program_pic.png',
                width: 65,
                height: 65,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "PHUL (5/3/1)",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "12 weeks",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff6B7280),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Appcolors.secondaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.fitness_center,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text("View Program"),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Exercise",
                            style: TextStyle(
                              fontSize: 14,
                              color: Appcolors.muteText,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Sets",
                            style: TextStyle(
                              fontSize: 14,
                              color: Appcolors.muteText,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "RPE",
                            style: TextStyle(
                              fontSize: 14,
                              color: Appcolors.muteText,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Leg Press",
                              style: TextStyle(fontSize: 16),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text("5x3", style: TextStyle(fontSize: 16)),
                          ),
                          Expanded(
                            child: Text(
                              "9",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Deadlift",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text("3x5", style: TextStyle(fontSize: 16)),
                          ),
                          Expanded(
                            child: Text(
                              "9",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Hamstring",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text("5x12", style: TextStyle(fontSize: 16)),
                          ),
                          Expanded(
                            child: Text(
                              "9",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Appcolors.accent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  height: 45,
                  child: Center(
                    child: Text(
                      "Start Workout",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
