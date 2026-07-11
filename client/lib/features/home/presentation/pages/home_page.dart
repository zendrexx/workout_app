import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/widgets/section_header.dart';
import 'package:client/features/history/presentation/widgets/streak_card.dart';
import 'package:client/features/history/presentation/widgets/tap_tooltip.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              const SectionHeader(title: "Today"),
              const SizedBox(height: 8),
              HomeProgramCard(),
              const SizedBox(height: 24),
              const SectionHeader(title: "Quick Start"),
              const SizedBox(height: 8),
              Material(
                color: Appcolors.primaryColor,
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () => context.push('/home/log_workout'),
                  child: Container(
                    height: 68,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Appcolors.accent.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.add_rounded,
                            color: Appcolors.accent,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
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
                              SizedBox(height: 2),
                              Text(
                                "Log a workout on a click",
                                style: TextStyle(
                                  color: Appcolors.muteText,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Appcolors.muteText,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SectionHeader(title: "Streak", trailing: TapTooltip()),
              const SizedBox(height: 8),
              StreakCard(),
            ],
          ),
        ),
      ),
    );
  }
}
