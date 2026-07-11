import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/router/router.dart';
import 'package:client/core/database/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AppBootstrap()));
}

/// The app is dark-only, but the default [ThemeData] is light — so any
/// surface the app itself doesn't explicitly paint (the canvas peeking
/// through during a page transition, a dialog barrier, the very first frame
/// before a Scaffold sets its own background) falls back to that light
/// theme and flashes white. Setting brightness/backgrounds here once, for
/// every MaterialApp the app ever builds, removes that fallback.
final ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "Futura",
  scaffoldBackgroundColor: Appcolors.backgroundColor,
  canvasColor: Appcolors.backgroundColor,
  dialogTheme: const DialogThemeData(backgroundColor: Appcolors.primaryColor),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Appcolors.accent,
    brightness: Brightness.dark,
  ).copyWith(
    surface: Appcolors.backgroundColor,
    onSurface: Colors.white,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);

class AppBootstrap extends ConsumerWidget {
  const AppBootstrap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isarAsync = ref.watch(isarProvider);

    return isarAsync.when(
      loading: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _darkTheme,
        home: const Scaffold(
          backgroundColor: Colors.black,
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (e, st) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _darkTheme,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(child: Text(e.toString())),
        ),
      ),
      data: (_) => const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: _darkTheme,
    );
  }
}
