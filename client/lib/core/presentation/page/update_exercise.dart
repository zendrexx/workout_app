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
        backgroundColor: const Color(0xff0F0F0F),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Color(0xffE2725B)),
                ),
              ),
              SizedBox(width: 16),
              // GestureDetector(
              //   onTap: () {},
              //   child: Text("Create", style: TextStyle(color: Colors.white)),
              // ),
              SizedBox(width: 16),
            ],
          ),
        ],
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        scrolledUnderElevation: 6,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff0F0F0F),
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
                      height: 35,
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        controller: _controller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          filled: true,
                          fillColor: Color(0xff4E4A43),
                          hintText: "Search Exercise",
                          hintStyle: TextStyle(
                            color: Color(0xff89898Ad),
                            fontSize: 14,
                          ),
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Color(0xff89898A),
                              size: 20,
                            ),
                            onPressed: () {
                              _controller.clear();
                              setState(() {}); // refresh to hide the X
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5,
                            ), // rounded corners
                            borderSide:
                                BorderSide.none, // removes the border line
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "All Exercises",
                      style: TextStyle(color: Color(0xff4E4E50)),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = state.exercises[index];
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
                  ],
                ),
              ),
            ),
          ),
          if (_selectedExercise.isNotEmpty) ...[
            Positioned(
              right: 0,
              bottom: 30,
              child: ElevatedButton(
                onPressed: () {
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F4F4F),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  elevation: 4,
                ),
                child: Text(
                  "Update exercise",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
