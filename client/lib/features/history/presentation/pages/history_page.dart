import 'package:client/features/history/presentation/providers/history_view_model_provider.dart';
import 'package:client/features/history/presentation/widgets/history_workout_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    //final state = ref.watch(historyViewModelProvider);
    return Scaffold(
      backgroundColor: Color(0xff0F0F0F),
      appBar: AppBar(
        title: Text(
          "HISTORY",
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 145,

                decoration: BoxDecoration(color: Color(0xff1A1A1A)),
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(color: Color(0xff212121)),
                      child: Text("Latest PR"),
                    ),
                  ],
                ),
              ),
              Container(
                height: 145,
                width: 20,
                decoration: BoxDecoration(color: Color(0xff1A1A1A)),
              ),
            ],
          ),
        ],
      ),
      // Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: ListView.builder(
      //     shrinkWrap: true,
      //     itemCount: state.psession.length,
      //     itemBuilder: (context, index) {
      //       final session = state.psession[index];

      //       return HistoryWorkoutContainerWidget(
      //         session: session,
      //         index: index,
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
