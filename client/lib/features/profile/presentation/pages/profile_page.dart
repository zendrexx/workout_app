import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/profile/domain/entities/lifter_overview.dart';
import 'package:client/features/profile/presentation/pages/profile_setup_flow.dart';
import 'package:client/features/profile/presentation/providers/profile_providers.dart';
import 'package:client/features/profile/presentation/widgets/identity_header.dart';
import 'package:client/features/profile/presentation/widgets/lifetime_stats_section.dart';
import 'package:client/features/profile/presentation/widgets/personal_records_section.dart';
import 'package:client/features/profile/presentation/widgets/profile_section_header.dart';
import 'package:client/features/profile/presentation/widgets/sbd_total_card.dart';
import 'package:client/features/profile/presentation/widgets/strength_level_card.dart';
import 'package:client/features/profile/presentation/widgets/training_insights_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The lifter's identity. History answers "what did I do?"; this page
/// answers "what have I become?" — strength level, records, the total and
/// lifetime numbers. Until setup runs, the tab hosts the onboarding flow.
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overviewAsync = ref.watch(lifterOverviewProvider);

    return overviewAsync.when(
      loading: () => const Scaffold(
        backgroundColor: Appcolors.backgroundColor,
        body: Center(
          child: CircularProgressIndicator(color: Appcolors.accent),
        ),
      ),
      error: (_, __) => const Scaffold(
        backgroundColor: Appcolors.backgroundColor,
        body: Center(
          child: Text(
            "Could not load your profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      data: (overview) => overview == null
          ? const ProfileSetupFlow()
          : _ProfileScaffold(overview: overview),
    );
  }
}

class _ProfileScaffold extends StatelessWidget {
  final LifterOverview overview;
  const _ProfileScaffold({required this.overview});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          "PROFILE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Appcolors.backgroundColor,
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => context.go('/profile/edit'),
            icon: const Icon(Icons.edit_outlined, color: Colors.white),
            tooltip: "Edit profile",
          ),
        ],
      ),
      body: _ProfileContent(overview: overview),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final LifterOverview overview;
  const _ProfileContent({required this.overview});

  @override
  Widget build(BuildContext context) {
    final assessment = overview.assessment;
    final sbdTotal = overview.sbdTotal;
    final unit = overview.profile.unit;

    void goToEdit() => context.go('/profile/edit');

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        IdentityHeader(overview: overview, onEdit: goToEdit),
        const SizedBox(height: 24),

        const ProfileSectionHeader(title: "Strength Level"),
        const SizedBox(height: 8),
        if (assessment != null)
          StrengthLevelCard(assessment: assessment, unit: unit)
        else
          StrengthLevelEmptyCard(onAddMaxes: goToEdit),
        const SizedBox(height: 24),

        PersonalRecordsSection(overview: overview, onAddRecord: goToEdit),
        const SizedBox(height: 16),

        if (sbdTotal != null) ...[
          const ProfileSectionHeader(title: "The Total"),
          const SizedBox(height: 8),
          SbdTotalCard(total: sbdTotal, unit: unit),
          const SizedBox(height: 24),
        ],

        LifetimeStatsSection(stats: overview.stats, unit: unit),
        const SizedBox(height: 24),

        if (TrainingInsightsSection.hasContent(overview.stats)) ...[
          TrainingInsightsSection(stats: overview.stats, unit: unit),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}
