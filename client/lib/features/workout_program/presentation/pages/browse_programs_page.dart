import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_program/domain/entities/program.dart';
import 'package:client/features/workout_program/domain/services/program_overview.dart';
import 'package:client/features/workout_program/presentation/providers/active_program_providers.dart';
import 'package:client/features/workout_program/presentation/providers/browse_programs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Discover program templates and make one the active program.
class BrowseProgramsPage extends ConsumerWidget {
  const BrowseProgramsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programsAsync = ref.watch(browseProgramsProvider);
    final activeTemplateId = ref
        .watch(activeProgramProvider)
        .valueOrNull
        ?.templateProgramId;

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Browse Programs",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: Appcolors.backgroundColor,
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      body: programsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(
          child: Text(
            "Could not load programs",
            style: TextStyle(color: Colors.white),
          ),
        ),
        data: (programs) {
          if (programs.isEmpty) {
            return const Center(
              child: Text(
                "No programs available yet.",
                style: TextStyle(fontSize: 14, color: Colors.white30),
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                "Pick a plan that fits your schedule. You can switch anytime.",
                style: TextStyle(fontSize: 13, color: Appcolors.muteText),
              ),
              const SizedBox(height: 16),
              ...programs.map(
                (program) => _ProgramCard(
                  program: program,
                  isActive: program.programId == activeTemplateId,
                  hasActiveProgram: activeTemplateId != null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ProgramCard extends ConsumerWidget {
  final Program program;
  final bool isActive;
  final bool hasActiveProgram;

  const _ProgramCard({
    required this.program,
    required this.isActive,
    required this.hasActiveProgram,
  });

  /// Seeded names carry the duration, e.g. "Full Body (4 Weeks)" — the card
  /// shows duration as a stat, so strip the parenthetical from the title.
  String get _displayName =>
      program.name.replaceAll(RegExp(r'\s*\(.*\)\s*$'), '');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overview = summarizeProgram(program);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => context.push('/home/view_program/${program.programId}'),
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Appcolors.primaryColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _DifficultyChip(difficulty: overview.difficulty),
                  const Spacer(),
                  if (isActive) const _CurrentPlanChip(),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                _displayName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                overview.splitLabel,
                style: const TextStyle(fontSize: 13, color: Appcolors.muteText),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _Stat(value: "${overview.weeks}", label: "WEEKS"),
                  _statDivider(),
                  _Stat(
                    value: "${overview.trainingDaysPerWeek}",
                    label: "DAYS / WEEK",
                  ),
                  _statDivider(),
                  _Stat(value: "${overview.totalWorkouts}", label: "WORKOUTS"),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: overview.equipment
                    .map((e) => _EquipmentChip(label: e))
                    .toList(),
              ),
              const SizedBox(height: 16),
              if (isActive)
                SizedBox(
                  width: double.infinity,
                  child: _SecondaryButton(
                    label: "View Program",
                    onTap: () =>
                        context.push('/home/view_program/${program.programId}'),
                  ),
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: _AccentButton(
                        label: "Start Program",
                        onTap: () => _startProgram(context, ref),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _SecondaryButton(
                      label: "Preview",
                      onTap: () => context.push(
                        '/home/view_program/${program.programId}',
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statDivider() {
    return Container(
      width: 1,
      height: 28,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Appcolors.secondaryColor,
    );
  }

  Future<void> _startProgram(BuildContext context, WidgetRef ref) async {
    // Starting over an existing program discards its progress — confirm.
    if (hasActiveProgram) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            backgroundColor: Appcolors.primaryColor,
            title: Text(
              "Start $_displayName?",
              style: const TextStyle(color: Colors.white),
            ),
            content: const Text(
              "This replaces your current active program and starts from Week 1. Your workout history is kept.",
              style: TextStyle(color: Appcolors.muteText),
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
                child: const Text(
                  "Start",
                  style: TextStyle(color: Appcolors.accent),
                ),
              ),
            ],
          );
        },
      );
      if (confirmed != true) return;
    }

    await ref.read(startProgramProvider).call(program.programId);
    ref.invalidate(activeProgramProvider);

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$_displayName is now your active program")),
    );
  }
}

class _DifficultyChip extends StatelessWidget {
  final ProgramDifficulty difficulty;
  const _DifficultyChip({required this.difficulty});

  Color get _color => switch (difficulty) {
    ProgramDifficulty.beginner => Colors.white70,
    ProgramDifficulty.intermediate => Appcolors.accent,
    ProgramDifficulty.advanced => const Color(0xffE2725B),
  };

  String get _label => switch (difficulty) {
    ProgramDifficulty.beginner => "BEGINNER",
    ProgramDifficulty.intermediate => "INTERMEDIATE",
    ProgramDifficulty.advanced => "ADVANCED",
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        _label,
        style: TextStyle(
          color: _color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class _CurrentPlanChip extends StatelessWidget {
  const _CurrentPlanChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Appcolors.accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(3),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check, size: 12, color: Appcolors.accent),
          SizedBox(width: 4),
          Text(
            "CURRENT PLAN",
            style: TextStyle(
              color: Appcolors.accent,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Appcolors.muteText,
            fontSize: 10,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

class _EquipmentChip extends StatelessWidget {
  final String label;
  const _EquipmentChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Appcolors.secondaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 11),
      ),
    );
  }
}

class _AccentButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _AccentButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: Appcolors.accent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _SecondaryButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Appcolors.secondaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
