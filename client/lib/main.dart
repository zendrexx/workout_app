import 'package:client/core/providers/isar_provider.dart';
import 'package:client/core/router/router.dart';
import 'package:client/core/database/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  //providerscope only hindi na init ng dbase
  runApp(ProviderScope(child: MyApp()));
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
