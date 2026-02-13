import 'package:client/features/workout_program/presentation/providers/program_view_model_provider.dart';
import 'package:client/features/workout_program/presentation/widgets/view_program_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewProgramPage extends ConsumerStatefulWidget {
  final String sessionId;
  const ViewProgramPage({super.key, required this.sessionId});

  @override
  ConsumerState<ViewProgramPage> createState() => _ViewProgramPageState();
}

class _ViewProgramPageState extends ConsumerState<ViewProgramPage> {
  // final sesService = PlannedSessionService();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(programViewModelProvider.notifier)
          .loadProgramById(widget.sessionId);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(programViewModelProvider);

    if (state.plannedSessions.isEmpty) {
      return Container(
        decoration: BoxDecoration(color: Colors.black),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    //final vm = ref.read(plannedViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "View Program",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: const Color(0xff0F0F0F),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //GestureDetector(onTap: () {}, child: Icon(Icons.more_horiz)),
              SizedBox(width: 16),
            ],
          ),
        ],
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Color.fromRGBO(15, 15, 15, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.programName.toUpperCase(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Sessions",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white30,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.programSessions.length,

                  itemBuilder: (context, index) {
                    final program = state.programSessions[index];

                    final exerciseList = program.exercises
                        .map((ex) => '${ex.exerciseName} (${ex.equipment})')
                        .join(', ');
                    return ViewProgramWidget(
                      title: program.name,
                      content: exerciseList,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
