import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:client/data/models/exercise.dart';
import 'package:client/data/services/database_service.dart';
import 'package:client/features/home/widgets/exercise_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';

class UpdateExercise extends ConsumerStatefulWidget {
  final int index;
  const UpdateExercise({super.key, required this.index});

  @override
  ConsumerState<UpdateExercise> createState() => _UpdateExerciseState();
}

class _UpdateExerciseState extends ConsumerState<UpdateExercise> {
  final Set<int> _selectedSessions = {};
  final TextEditingController _controller = TextEditingController();

  void _toggleSession(int index) {
    setState(() {
      if (_selectedSessions.contains(index)) {
        _selectedSessions.clear(); // deselect if tapped again
      } else {
        _selectedSessions
          ..clear() // remove any existing selection
          ..add(index);
      }
    });
  }

  List<Exercise> _exercise = [];

  @override
  void initState() {
    super.initState();
    print("Update initState called ✅");
    _initWorkouts();
  }

  void _initWorkouts() async {
    final workouts = await DatabaseService.db.exercises.where().findAll();
    print("Loaded ${workouts.length} exercises from Isar");
    setState(() {
      _exercise = workouts;
    });
  }

  void updateExercise(WidgetRef ref, Exercise value) {
    ref
        .read(tempSessionProvider.notifier)
        .updateExerciseAt(widget.index, value);
  }

  @override
  Widget build(BuildContext context) {
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
              GestureDetector(
                onTap: () {},
                child: Text("Create", style: TextStyle(color: Colors.white)),
              ),
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
                      itemCount: _exercise.length,
                      itemBuilder: (context, index) {
                        final exercise = _exercise[index];
                        return GestureDetector(
                          onTap: () => _toggleSession(index),
                          child: ExerciseCardWidget(
                            isSelectable: true,
                            isSelected: _selectedSessions.contains(index),
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
          if (_selectedSessions.isNotEmpty) ...[
            Positioned(
              right: 0,
              bottom: 30,
              child: ElevatedButton(
                onPressed: () {
                  for (final sessionIndex in _selectedSessions) {
                    updateExercise(ref, _exercise[sessionIndex]);
                  }
                  context.pop();
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
