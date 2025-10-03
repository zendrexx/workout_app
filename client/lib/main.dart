import 'package:client/core/router/router.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/services/database_service.dart';
import 'package:client/data/services/exercise_service.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(const MyApp());
  await _setup();
}

Future<void> _setup() async {
  await DatabaseService.setup();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        fontFamily: "Futura",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
    );
  }
}
