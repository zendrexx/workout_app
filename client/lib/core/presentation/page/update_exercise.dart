import 'package:client/core/constants/AppColors.dart';
import 'package:client/core/presentation/abstract/update_exercise_abstract.dart';
import 'package:client/features/workout_planning/domain/entities/exercise.dart';
import 'package:client/features/home/presentation/widgets/exercise_card_widget.dart';
import 'package:client/features/workout_planning/presentation/providers/exercise_view_model_provider.dart';
import 'package:client/core/presentation/state/exercise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UpdateExercise extends ConsumerStatefulWidget {
  final AutoDisposeStateNotifierProvider<StateNotifier, Object?> provider;
  final int index;
  const UpdateExercise({
    super.key,
    required this.index,
    required this.provider,
  });

  @override
  ConsumerState<UpdateExercise> createState() => _UpdateExerciseState();
}

class _UpdateExerciseState extends ConsumerState<UpdateExercise> {
  final Set<String> _selectedExercise = {};
  final TextEditingController _controller = TextEditingController();

  void _toggleExercise(ExerciseState exercise) {
    setState(() {
      if (_selectedExercise.contains(exercise.exId)) {
        //if na click na
        _selectedExercise.remove(exercise.exId); //remove ex
      } else {
        _selectedExercise.clear();
        _selectedExercise.add(exercise.exId);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print("Update initState called ✅");
  }

  void updateExercise(WidgetRef ref, Exercise value) {
    // final plannedExercise = TempPlannedExercise(exercise: value);

    // ref
    //     .read(tempSessionProvider.notifier)
    //     .updateExerciseAt(widget.index, plannedExercise);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(exerciseViewModelProvider);
    final vm = ref.read(widget.provider.notifier);
    final query = _controller.text.trim().toLowerCase();
    final exercises = query.isEmpty
        ? state.exercises
        : state.exercises
              .where((e) => e.name.toLowerCase().contains(query))
              .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Update Exercise",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: Appcolors.backgroundColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Appcolors.danger),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
        elevation: 5,
        shadowColor: Colors.black.withValues(alpha: 0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Appcolors.backgroundColor,
      body: Stack(
        children: [
          SizedBox.expand(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 44,
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        controller: _controller,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          filled: true,
                          fillColor: Appcolors.primaryColor,
                          hintText: "Search Exercise",
                          hintStyle: const TextStyle(
                            color: Appcolors.muteText,
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Appcolors.muteText,
                            size: 20,
                          ),
                          suffixIcon: query.isEmpty
                              ? null
                              : IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Appcolors.muteText,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    _controller.clear();
                                    setState(() {});
                                  },
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
                            borderSide: const BorderSide(
                              color: Appcolors.accent,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "All Exercises",
                      style: TextStyle(
                        color: Appcolors.muteText,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (exercises.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: Center(
                          child: Text(
                            'No exercises match "$query".',
                            style: const TextStyle(
                              color: Appcolors.muteText,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: exercises.length,
                        itemBuilder: (context, index) {
                          final exercise = exercises[index];
                          return GestureDetector(
                            onTap: () => _toggleExercise(exercise),
                            child: ExerciseCardWidget(
                              isSelectable: true,
                              isSelected: _selectedExercise.contains(
                                exercise.exId,
                              ),
                              name: exercise.name,
                              imagePath: exercise.imagePath,
                              primMuscle: exercise.primMuscle,
                              equipment: exercise.equipment,
                            ),
                          );
                        },
                      ),
                    const SizedBox(height: 72),
                  ],
                ),
              ),
            ),
          ),
          if (_selectedExercise.isNotEmpty) ...[
            Positioned(
              right: 16,
              bottom: 24,
              child: Material(
                color: Appcolors.accent,
                borderRadius: BorderRadius.circular(30),
                elevation: 4,
                shadowColor: Colors.black.withValues(alpha: 0.5),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    for (final exId in _selectedExercise) {
                      final exercise = state.exercises.firstWhere(
                        (e) => e.exId == exId,
                      );

                      (vm as UpdateExerciseAbstract).updateExerciseAt(
                        widget.index,
                        exercise,
                      );
                      context.pop();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    child: Text(
                      "Update exercise",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
