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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SizedBox(
            height: 44,
            child: TextField(
              style: const TextStyle(fontSize: 14, color: Colors.white),
              cursorColor: Colors.white,
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                filled: true,
                fillColor: Appcolors.primaryColor,
                hintText: "Search sessions",
                hintStyle: const TextStyle(
                  color: Appcolors.muteText,
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
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
          const SizedBox(height: 20),
          if (sessions.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Column(
                children: [
                  Icon(
                    Icons.event_note_rounded,
                    color: Appcolors.muteText,
                    size: 32,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    query.isEmpty
                        ? "No sessions yet."
                        : 'No sessions match "$query".',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (query.isEmpty) ...[
                    const SizedBox(height: 4),
                    const Text(
                      "Create one or save a workout to get started.",
                      style: TextStyle(
                        color: Appcolors.muteText,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            )
          else
            ...sessions.map(
              (session) => HomeSessionListWidget(
                sessionId: session.sessionId,
                title: session.name,
              ),
            ),
        ],
      ),
    );
  }
}
