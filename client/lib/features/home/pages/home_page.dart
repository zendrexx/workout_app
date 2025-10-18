import 'package:client/core/notifier/planned_session_provider.dart';
import 'package:client/features/home/widgets/custom_button_widget.dart';
import 'package:client/features/home/widgets/home_list_widget.dart';
import 'package:client/features/home/widgets/streak_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _isProgramExpanded = true;
  bool _isSessionExpanded = true;

  @override
  Widget build(BuildContext context) {
    final plannedSessionsAsync = ref.watch(plannedSessionListProvider);
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
        actions: [StreakWidget(count: 8)],
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
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff2F4F4F),
                        Color(0xff0F2027),
                        Color(0xff2C5364),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'START WORKOUT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Quick Start",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff4E4E50),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(
                    title: "New Program",
                    icon: Icons.add,
                    onTap: () => context.push('/home/program'),
                  ),
                  SizedBox(width: 10),
                  CustomButtonWidget(
                    title: "New Session",
                    icon: Icons.explore_outlined,
                    onTap: () => context.push('/home/create_sessions'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => setState(
                      () => _isProgramExpanded = !_isProgramExpanded,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Icon(
                            _isProgramExpanded
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_right,
                            color: Color(0xff4E4E50),
                            size: 25,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "My Programs",
                            style: TextStyle(
                              color: Color(0xff4E4E50),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Expand/Collapse content
                  AnimatedCrossFade(
                    duration: Duration(milliseconds: 250),

                    crossFadeState: _isProgramExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {},
                    ),

                    secondChild: SizedBox.shrink(),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => setState(
                      () => _isSessionExpanded = !_isSessionExpanded,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Icon(
                            _isSessionExpanded
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_right,
                            color: Color(0xff4E4E50),
                            size: 25,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "My Sessions",
                            style: TextStyle(
                              color: Color(0xff4E4E50),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Expand/Collapse content
                  AnimatedCrossFade(
                    duration: Duration(milliseconds: 250),

                    crossFadeState: _isSessionExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: plannedSessionsAsync.when(
                      data: (sessions) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: sessions.length,
                          itemBuilder: (context, index) {
                            final session = sessions[index];
                            final exercises = session.plannedExercise.toList();
                            () async {
                              for (final e in session.plannedExercise) {
                                await e.exercise.load();
                                print(
                                  "PlannedExercise -> ${e.exercise.value?.name}",
                                );
                              }
                            }();
                            return HomeListWidget(
                              id: session.id,
                              fOntap: () {
                                print("Selected session: ${session.name}");
                              },

                              title: session.name ?? "Untitled Session",
                              exercises: exercises,
                            );
                          },
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Text(
                        'Error: $err',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                    secondChild: SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
