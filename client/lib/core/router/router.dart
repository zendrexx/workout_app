import 'package:client/core/config/app_destination.dart';
import 'package:client/features/history/pages/history_page.dart';
import 'package:client/features/home/pages/create_session_page.dart';
import 'package:client/features/home/pages/home_page.dart';
import 'package:client/features/home/pages/program_page.dart';
import 'package:client/features/home/pages/select_session_page.dart';
import 'package:client/features/main_page.dart';
import 'package:client/features/profile/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: appDestination[0].path,
              builder: (context, state) => const HistoryPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: appDestination[1].path,
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: 'program',
                  builder: (context, state) => const ProgramPage(),
                  routes: [
                    GoRoute(
                      path: 'select_session',
                      builder: (context, state) => const SelectSessionPage(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'create_sessions',
                  builder: (context, state) => const CreateSessionPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: appDestination[2].path,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
