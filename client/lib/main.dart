import 'package:client/core/router/router.dart';
import 'package:client/data/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await _setup();
  runApp(ProviderScope(child: const MyApp()));
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
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
