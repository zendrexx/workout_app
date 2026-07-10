import 'package:client/features/history/presentation/widgets/streak_card.dart';
import 'package:client/features/home/presentation/providers/home_view_model_provider.dart';
import 'package:client/features/home/presentation/providers/visible_session_provider.dart';
import 'package:client/features/home/presentation/widgets/custom_button_widget.dart';
import 'package:client/features/home/presentation/widgets/home_program_card.dart';
import 'package:client/features/home/presentation/widgets/home_program_list_widget.dart';
import 'package:client/features/home/presentation/widgets/home_session_list_widget.dart';
import 'package:client/features/home/presentation/widgets/streak_widget.dart';
import 'package:client/features/workout_planning/presentation/state/planned_session_state.dart';
import 'package:client/features/workout_planning/presentation/statemappers/to_state_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<PlannedSessionState> sessions = [];
  bool _isProgramExpanded = true;
  bool _isSessionExpanded = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final visibleSessionState = ref.watch(visibleSessionsProvider);
    final state = ref.watch(homeViewModelProvider);
    final vm = ref.watch(homeViewModelProvider.notifier);
    return Scaffold(
      backgroundColor: Color(0xff0F0F0F),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeProgramCard(),
              SizedBox(height: 16),
              Material(
                color: Color(0xff1A1A1A),
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () => context.push('/home/log_workout'),
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Empty",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Log workouts on a click",
                              style: TextStyle(
                                color: Color(0xffA1A1AA),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              StreakCard(),
            ],
          ),
        ),
      ),
    );
  }
}
