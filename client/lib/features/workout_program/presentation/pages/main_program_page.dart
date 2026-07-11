import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/widgets/section_header.dart';
import 'package:client/features/workout_program/presentation/providers/active_program_providers.dart';
import 'package:client/features/workout_program/presentation/providers/today_workout_provider.dart';
import 'package:client/features/workout_program/presentation/state/today_workout.dart';
import 'package:client/features/workout_program/presentation/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainProgramPage extends StatelessWidget {
  const MainProgramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F0F0F),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "PROGRAM",
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
              const SectionHeader(title: "Active Program"),
              const SizedBox(height: 8),
              _ActiveProgramCard(),
              const SizedBox(height: 24),
              const SectionHeader(title: "Manage"),
              const SizedBox(height: 8),
              _ProgramActionTile(
                icon: Icons.storefront_rounded,
                title: "Browse Programs",
                subtitle: "Coach-made",
                onTap: () => context.push('/program/browse'),
              ),
              const SizedBox(height: 12),
              _ProgramActionTile(
                icon: Icons.add_circle_outline_rounded,
                title: "Create Sessions",
                subtitle: "Build your own",
                onTap: () => context.push('/home/create_sessions'),
              ),
              const SizedBox(height: 12),
              _ProgramActionTile(
                icon: Icons.event_note_rounded,
                title: "View Sessions",
                subtitle: "View your own sessions",
                onTap: () => context.push('/program/sessions'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActiveProgramCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayAsync = ref.watch(todayWorkoutProvider);

    return Container(
      constraints: const BoxConstraints(minHeight: 125),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1A1A1A),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Appcolors.secondaryColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: todayAsync.when(
        loading: () => const SizedBox(
          height: 93,
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (_, __) => const SizedBox(
          height: 93,
          child: Center(
            child: _EmptyState(
              icon: Icons.error_outline_rounded,
              message: "Could not load program",
            ),
          ),
        ),
        data: (today) => _buildContent(context, ref, today),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, TodayWorkout today) {
    if (today.status == TodayStatus.none) {
      return const SizedBox(
        height: 93,
        child: Center(
          child: _EmptyState(
            icon: Icons.fitness_center_rounded,
            message: "No Active Program",
          ),
        ),
      );
    }

    final isCompleted = today.status == TodayStatus.completed;
    final totalWeeks = today.program?.week.length ?? 0;

    // Fraction of the program finished, based on fully-completed weeks.
    final double progress = isCompleted
        ? 1.0
        : (totalWeeks > 0
              ? ((today.week - 1).clamp(0, totalWeeks)) / totalWeeks
              : 0.0);

    final String subtitle = isCompleted
        ? "Completed • $totalWeeks weeks"
        : "Week ${today.week} of $totalWeeks";

    return Row(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Appcolors.accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset('assets/images/program_pic.png'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        today.program?.name ?? "Program",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: () => _showOptions(context, ref),
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ProgressBar(progress: progress),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xffA1A1AA),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showOptions(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Appcolors.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.refresh, color: Colors.white),
                title: const Text(
                  "Restart Program",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Start over from Week 1, keeping this program",
                  style: TextStyle(color: Appcolors.muteText),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _confirmRestart(context, ref);
                },
              ),
              ListTile(
                leading: const Icon(Icons.swap_horiz, color: Color(0xffE2725B)),
                title: const Text(
                  "Replace Program",
                  style: TextStyle(color: Color(0xffE2725B)),
                ),
                subtitle: const Text(
                  "Remove this program so you can pick another",
                  style: TextStyle(color: Appcolors.muteText),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _confirmReplace(context, ref);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _confirmRestart(BuildContext context, WidgetRef ref) async {
    final confirmed = await _confirmDialog(
      context,
      title: "Restart Program?",
      message:
          "Your progress will be reset to Week 1, Day 1. The program itself is kept.",
      confirmLabel: "Restart",
    );
    if (!confirmed) return;

    final active = await ref.read(activeProgramProvider.future);
    if (active == null) return;

    await ref.read(restartActiveProgramProvider).call(active);
    ref.invalidate(activeProgramProvider);
  }

  Future<void> _confirmReplace(BuildContext context, WidgetRef ref) async {
    final confirmed = await _confirmDialog(
      context,
      title: "Replace Program?",
      message:
          "This removes your current active program and its progress. You can start a new one afterwards.",
      confirmLabel: "Replace",
      isDestructive: true,
    );
    if (!confirmed) return;

    await ref.read(clearActiveProgramProvider).call();
    ref.invalidate(activeProgramProvider);
  }

  Future<bool> _confirmDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmLabel,
    bool isDestructive = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Appcolors.primaryColor,
          title: Text(title, style: const TextStyle(color: Colors.white)),
          content: Text(
            message,
            style: const TextStyle(color: Appcolors.muteText),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: Text(
                confirmLabel,
                style: TextStyle(
                  color: isDestructive
                      ? const Color(0xffE2725B)
                      : Appcolors.accent,
                ),
              ),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }
}

class _ProgramActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ProgramActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff1A1A1A),
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
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
                child: Icon(icon, color: Appcolors.accent, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
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
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;

  const _EmptyState({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Appcolors.muteText, size: 26),
        const SizedBox(height: 8),
        Text(
          message,
          style: const TextStyle(
            color: Color(0xffA1A1AA),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
