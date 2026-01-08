import 'package:client/core/notifier/planned_session_stream_provider.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_view_model_provider.dart';
import 'package:client/features/workout_planning/presentation/viewmodel/planned_workout_viewmodel.dart';
import 'package:client/data/repositories/planned_session_repo.dart';
import 'package:client/data/services/save_to_temp.dart';
import 'package:client/features/home/widgets/long_custom_button.dart';
import 'package:client/features/home/widgets/session_workout_widget.dart';
import 'package:client/widgets/animeted_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class CreateSessionPage extends ConsumerStatefulWidget {
  final int? sessionId;
  const CreateSessionPage({super.key, this.sessionId});
  @override
  ConsumerState<CreateSessionPage> createState() => _CreateSessionPageState();
}

class _CreateSessionPageState extends ConsumerState<CreateSessionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  // final sesService = PlannedSessionService();
  bool checkName = true;
  bool isEditMode = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void cancel() {
    context.push('/home');
    ref.invalidate(plannedViewModelProvider);
  }

  @override
  void initState() {
    super.initState();
    // if (widget.sessionId != null) {
    //   isEditMode = true;
    //   var save = SaveToTemp(ref: ref);
    //   save.convertToTemp(widget.sessionId!);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannedViewModelProvider);
    final vm = ref.read(plannedViewModelProvider.notifier);

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            isEditMode ? "Edit Session" : "Create Session",
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
                  onTap: () => cancel(),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Color(0xffE2725B)),
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      // all good
                      showCustomSnackbar(
                        context,
                        "Session Added",
                        color: Colors.black,
                      );
                      vm.save();
                    }
                  },

                  child: Text(
                    isEditMode ? "Confirm" : "Create",
                    style: TextStyle(color: Colors.white),
                  ),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  cursorColor: Colors.white,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Session Name",
                    suffixIcon: _controller.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.white),
                            onPressed: () {
                              _controller.clear();
                              setState(() {});
                            },
                          )
                        : null,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),

                    // Border when focused
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name'; // red text + border
                    }

                    return null; // ✅ no error
                  },
                  onChanged: (value) {
                    vm.addName(value);
                  },
                ),
                SizedBox(height: 10),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    final current = state.exercises[index];
                    return SessionWorkoutWidget(
                      title: current.exerciseName,
                      equipment: current.equipment,
                      imagePath: current.exercisePath,
                      index: index,
                    );
                  }),
                  itemCount: state.exercises.length,
                  shrinkWrap: true,
                ),

                SizedBox(height: 10),
                LongCustomButton(
                  title: "+ Add Exercises",
                  onTap: () =>
                      context.push("/home/create_sessions/add_exercise"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
