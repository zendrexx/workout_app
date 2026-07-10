import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/home/presentation/providers/home_view_model_provider.dart';
import 'package:client/features/home/presentation/widgets/home_session_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Browse every reusable session (built via Create Session, or saved from a
/// "Start Empty" workout) and start one directly.
class SessionsListPage extends ConsumerStatefulWidget {
  const SessionsListPage({super.key});

  @override
  ConsumerState<SessionsListPage> createState() => _SessionsListPageState();
}

class _SessionsListPageState extends ConsumerState<SessionsListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    final query = _controller.text.trim().toLowerCase();
    final sessions = state.session
        .where((s) => query.isEmpty || s.name.toLowerCase().contains(query))
        .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "My Sessions",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: const Color(0xff0F0F0F),
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xff0F0F0F),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
                child: TextField(
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  cursorColor: Colors.white,
                  controller: _controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    filled: true,
                    fillColor: Appcolors.primaryColor,
                    hintText: "Search sessions",
                    hintStyle: TextStyle(
                      color: Appcolors.muteText,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Appcolors.muteText,
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Appcolors.accent),
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                ),
              ),
              SizedBox(height: 16),
              if (sessions.isEmpty)
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      'No sessions yet.\nCreate one or save a workout to get started.',
                      style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sessions.length,
                  itemBuilder: (context, index) {
                    final session = sessions[index];
                    return HomeSessionListWidget(
                      sessionId: session.sessionId,
                      title: session.name,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
