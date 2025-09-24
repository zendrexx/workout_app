import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDestination {
  final String title;
  final IconData icon;
  final String path;

  const AppDestination({
    required this.title,
    required this.icon,
    required this.path,
  });
}

const appDestination = [
  AppDestination(title: "History", icon: Icons.history, path: '/history'),
  AppDestination(title: "Home", icon: Icons.circle_outlined, path: '/home'),
  AppDestination(title: "Profile", icon: Icons.person, path: '/profile'),
];
