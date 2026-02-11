import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          .read(plannedSessionViewModelProvider.notifier)
          .loadSessionById(widget.sessionId);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannedSessionViewModelProvider);

    if (state.exercises.isEmpty) {
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
          "View Session",
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
              GestureDetector(onTap: () {}, child: Icon(Icons.more_horiz)),
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
                  state.name.toUpperCase(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Exercises",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white30,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.exercises.length,
                  itemBuilder: (context, index) {
                    final exercises = state.exercises.toList();

                    return ViewProgramWidget(
                      title: exercises[index].exerciseName,
                      equipment: exercises[index].equipment,
                      imagePath: exercises[index].imagePath,
                      index: index,
                      plannedSets: exercises[index].sets.toList(),
                      notes: exercises[index].notes,
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
