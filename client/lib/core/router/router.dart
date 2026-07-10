import 'package:client/core/config/app_destination.dart';
import 'package:client/features/auth/presentation/onboarding/onboarding_screen.dart';
import 'package:client/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:client/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:client/features/auth/presentation/pages/splash_screen.dart';
import 'package:client/features/history/presentation/pages/history_page.dart';
import 'package:client/features/history/presentation/pages/view_history_page.dart';
import 'package:client/core/presentation/page/add_exercise_page.dart';
import 'package:client/features/workout_planning/presentation/pages/create_session_page.dart';
import 'package:client/features/home/presentation/pages/home_page.dart';
import 'package:client/features/workout_logging/presentation/pages/log_workout_page.dart';
import 'package:client/features/workout_program/presentation/pages/browse_programs_page.dart';
import 'package:client/features/workout_program/presentation/pages/main_program_page.dart';
import 'package:client/features/workout_program/presentation/pages/program_page.dart';
import 'package:client/features/workout_program/presentation/pages/select_session_page.dart';
import 'package:client/core/presentation/page/update_exercise.dart';
import 'package:client/features/workout_planning/presentation/pages/view_session_page.dart';
import 'package:client/features/workout_planning/presentation/pages/sessions_list_page.dart';
import 'package:client/features/main_page.dart';
import 'package:client/features/profile/presentation/pages/profile_page.dart';
import 'package:client/features/workout_program/presentation/pages/view_program_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/auth/signin',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/auth/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/auth/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: appDestination[0].path,
              builder: (context, state) => const MainProgramPage(),
              routes: [
                GoRoute(
                  path: 'sessions',
                  builder: (context, state) => const SessionsListPage(),
                ),
                GoRoute(
                  path: 'browse',
                  builder: (context, state) => const BrowseProgramsPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: appDestination[1].path,
              builder: (context, state) => const HistoryPage(),
              routes: [
                GoRoute(
                  path: 'view_history/:index',
                  builder: (context, state) {
                    final index = int.parse(state.pathParameters['index']!);
                    return ViewHistoryPage(index: index);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: appDestination[2].path,
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: 'view_session/:id',
                  builder: (context, state) {
                    final sessionId = state.pathParameters['id']!;
                    return ViewSessionPage(sessionId: sessionId);
                  },
                ),
                GoRoute(
                  path: 'view_program/:id',
                  builder: (context, state) {
                    final sessionId = state.pathParameters['id']!;
                    return ViewProgramPage(sessionId: sessionId);
                  },
                ),
                GoRoute(
                  path: 'program',
                  builder: (context, state) {
                    final programId = state.uri.queryParameters['programId'];

                    return ProgramPage(programId: programId);
                  },
                  routes: [
                    GoRoute(
                      path: 'select_session',
                      builder: (context, state) => const SelectSessionPage(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'log_workout',
                  builder: (context, state) {
                    final sessionIdStr = state.uri.queryParameters['sessionId'];
                    final programId = state.uri.queryParameters['programId'];
                    final week = int.tryParse(
                      state.uri.queryParameters['week'] ?? '',
                    );
                    final day = int.tryParse(
                      state.uri.queryParameters['day'] ?? '',
                    );

                    return LogWorkoutPage(
                      sessionId: sessionIdStr,
                      programId: programId,
                      week: week,
                      day: day,
                    );
                  },
                ),
                GoRoute(
                  path: 'create_sessions',
                  builder: (context, state) {
                    final sessionId = state.uri.queryParameters['sessionId'];

                    return CreateSessionPage(sessionId: sessionId);
                  },
                  routes: [
                    GoRoute(
                      path: 'add_exercise',
                      builder: (context, state) {
                        final provider =
                            state.extra
                                as AutoDisposeStateNotifierProvider<
                                  StateNotifier,
                                  Object?
                                >;
                        return AddExercisePage(provider: provider);
                      },
                    ),
                    GoRoute(
                      path: 'update_exercise/:index',
                      builder: (context, state) {
                        final provider =
                            state.extra
                                as AutoDisposeStateNotifierProvider<
                                  StateNotifier,
                                  Object?
                                >;
                        final index = int.parse(state.pathParameters['index']!);
                        return UpdateExercise(index: index, provider: provider);
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
              path: appDestination[3].path,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
