import 'package:client/core/notifier/planned_session_stream_provider.dart';
import 'package:client/core/notifier/temp_session_notifier.dart';
import 'package:client/data/repositories/save_session.dart';
import 'package:client/data/services/planned_session_service.dart';
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
  TextEditingController _controller = new TextEditingController();
  final sesService = PlannedSessionService();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void addTitle(WidgetRef ref, String title) {
    ref.read(tempSessionProvider.notifier).addTitle(title);
  }

  void cancel() {
    context.push('/home');
    ref.invalidate(tempSessionProvider);
  }

  void addSession() async {
    if (_controller.text.trim().isEmpty) {
      return;
    }
    addTitle(ref, _controller.text.trim());
    final tempSession = ref.read(tempSessionProvider);
    await saveSession(tempSession, ref);

    ref.invalidate(tempSessionProvider);
    _controller.clear();
    final sessions = await sesService.getAllPlannedSession();

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    if (widget.sessionId != null) {
      var save = SaveToTemp(ref: ref);
      save.convertToTemp(widget.sessionId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final plannedExercise = ref.watch(tempSessionProvider);
    if (plannedExercise.name != _controller.text) {
      _controller.text = plannedExercise.name ?? '';
    }
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Create Sessions",
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
                      addSession();
                    }
                  },

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
                    setState(() {}); // refresh to show/hide the X
                  },
                ),
                SizedBox(height: 10),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    final current = plannedExercise.plannedExercise[index];
                    return SessionWorkoutWidget(
                      title: current.exercise?.name ?? '',
                      equipment: current.exercise?.equipment ?? '',
                      imagePath: current.exercise?.imagePath ?? '',
                      index: index,
                      id: current.exercise?.id ?? 0,
                    );
                  }),
                  itemCount: plannedExercise.plannedExercise.length,
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
