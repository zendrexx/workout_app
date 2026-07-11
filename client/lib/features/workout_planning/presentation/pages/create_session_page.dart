import 'dart:async';

import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/workout_planning/presentation/events/planned_session_ui_event.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_session_view_model_provider.dart';
import 'package:client/features/workout_planning/presentation/viewmodel/planned_session_viewmodel.dart';
import 'package:client/features/workout_planning/presentation/widgets/planned_exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateSessionPage extends ConsumerStatefulWidget {
  final String? sessionId;
  const CreateSessionPage({super.key, this.sessionId});
  @override
  ConsumerState<CreateSessionPage> createState() => _CreateSessionPageState();
}

class _CreateSessionPageState extends ConsumerState<CreateSessionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  late final StreamSubscription<PlannedSessionUiEvent> _subscription;
  bool isEditMode = false;

  @override
  void dispose() {
    _nameController.dispose();
    _subscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    if (widget.sessionId != null) {
      isEditMode = true;
      Future.microtask(() {
        ref
            .read(plannedSessionViewModelProvider.notifier)
            .loadSessionById(widget.sessionId!);
      });
    }

    _subscription = ref
        .read(plannedSessionViewModelProvider.notifier)
        .events
        .listen((event) {
          if (!mounted) return;
          switch (event) {
            case ShowError(:final message):
              _showSnack(message);
              break;
            case SaveSuccess(:final message):
              _showSnack(message);
              Navigator.pop(context);
              break;
          }
        });
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Appcolors.secondaryColor,
          content: Text(message, style: const TextStyle(color: Colors.white)),
        ),
      );
  }

  void _cancel() {
    ref.invalidate(plannedSessionViewModelProvider);
    context.push('/program');
  }

  void _addExercise() {
    context.push(
      "/home/create_sessions/add_exercise",
      extra: plannedSessionViewModelProvider,
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(plannedSessionViewModelProvider.notifier).save();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannedSessionViewModelProvider);
    final vm = ref.read(plannedSessionViewModelProvider.notifier);

    // Keep the field in sync when a session is loaded for editing, without
    // fighting the user's cursor while they type.
    if (_nameController.text != state.name) {
      _nameController.value = TextEditingValue(
        text: state.name,
        selection: TextSelection.collapsed(offset: state.name.length),
      );
    }

    final exercises = state.exercises;

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          isEditMode ? "Edit Session" : "Create Session",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Appcolors.backgroundColor,
        actions: [
          TextButton(
            onPressed: _cancel,
            child: const Text(
              "Cancel",
              style: TextStyle(color: Appcolors.danger, fontSize: 15),
            ),
          ),
          const SizedBox(width: 8),
        ],
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _nameField(vm),
                    const SizedBox(height: 20),
                    if (exercises.isEmpty)
                      const _EmptyState()
                    else
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: exercises.length,
                        itemBuilder: (context, index) {
                          final current = exercises[index];
                          return PlannedExerciseCard(
                            key: ValueKey(
                              '${current.exerciseName}-$index-${current.sets.length}',
                            ),
                            title: current.exerciseName,
                            equipment: current.equipment,
                            imagePath: current.imagePath,
                            exerciseIndex: index,
                            notes: current.notes,
                            sets: current.sets,
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
            _bottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _nameField(PlannedSessionViewmodel vm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionLabel("SESSION NAME"),
        const SizedBox(height: 8),
        TextFormField(
          controller: _nameController,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            filled: true,
            fillColor: Appcolors.primaryColor,
            hintText: "e.g. Push Day",
            hintStyle: const TextStyle(color: Appcolors.muteText),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            suffixIcon: _nameController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Appcolors.muteText),
                    onPressed: () {
                      _nameController.clear();
                      vm.addName('');
                      setState(() {});
                    },
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Appcolors.accent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Appcolors.danger),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Appcolors.danger),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter a session name';
            }
            return null;
          },
          onChanged: (value) {
            vm.addName(value);
            setState(() {}); // refresh the clear button
          },
        ),
      ],
    );
  }

  Widget _sectionLabel(String text) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 14,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Appcolors.accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _bottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: Appcolors.backgroundColor,
        border: Border(top: BorderSide(color: Appcolors.secondaryColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ActionButton(
              label: "Add Exercise",
              icon: Icons.add,
              filled: false,
              onTap: _addExercise,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ActionButton(
              label: isEditMode ? "Confirm" : "Create",
              icon: Icons.check_rounded,
              filled: true,
              onTap: _save,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool filled;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = filled ? Appcolors.backgroundColor : Colors.white;
    return Material(
      color: filled ? Appcolors.accent : Appcolors.primaryColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: filled ? null : Border.all(color: Appcolors.secondaryColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: foreground),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: foreground,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 56),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: Appcolors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.list_alt,
                size: 32,
                color: Appcolors.muteText,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Build your session",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Add exercises to plan out this session.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Appcolors.muteText, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
