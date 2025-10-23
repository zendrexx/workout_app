import 'package:client/core/config/app_destination.dart';
import 'package:client/features/history/pages/history_page.dart';
import 'package:client/features/history/pages/view_history_page.dart';
import 'package:client/features/home/pages/add_exercise_page.dart';
import 'package:client/features/home/pages/create_session_page.dart';
import 'package:client/features/home/pages/home_page.dart';
import 'package:client/features/home/pages/program_page.dart';
import 'package:client/features/home/pages/select_session_page.dart';
import 'package:client/features/home/pages/update_exercise.dart';
import 'package:client/features/home/pages/view_session_page.dart';
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
              routes: [
                GoRoute(
                  path: 'view_history',
                  builder: (context, state) => const ViewHistoryPage(),
                ),
              ],
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
                  path: 'view_session/:id',
                  builder: (context, state) {
                    final id = int.parse(state.pathParameters['id']!);
                    return ViewSessionPage(id: id);
                  },
                ),
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
                  routes: [
                    GoRoute(
                      path: 'add_exercise',
                      builder: (context, state) => const AddExercisePage(),
                    ),
                    GoRoute(
                      path: 'update_exercise/:index',
                      builder: (context, state) {
                        final index = int.parse(state.pathParameters['index']!);
                        return UpdateExercise(index: index);
                      },
                    ),
                  ],
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
