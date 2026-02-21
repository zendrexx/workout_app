import 'dart:async';

import 'package:client/features/workout_planning/presentation/events/planned_session_ui_event.dart';
import 'package:client/features/workout_planning/presentation/providers/planned_session_view_model_provider.dart';
import 'package:client/features/home/presentation/widgets/long_custom_button.dart';
import 'package:client/features/workout_planning/presentation/widgets/session_workout_widget.dart';
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
  bool checkName = true;
  bool isEditMode = false;
  @override
  void dispose() {
    _nameController.dispose();
    _subscription.cancel();
    super.dispose();
  }

  void cancel() {
    context.push('/home');
    ref.invalidate(plannedSessionViewModelProvider);
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
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
              break;

            case SaveSuccess(:final message):
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
              Navigator.pop(context);
              break;
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plannedSessionViewModelProvider);

    final vm = ref.read(plannedSessionViewModelProvider.notifier);
    _nameController.text = state.name;
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
                      await vm.save();
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
                  controller: _nameController,
                  cursorColor: Colors.white,

                  decoration: InputDecoration(
                    hintText: "Session Name",
                    suffixIcon: state.name.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.white),
                            onPressed: () {
                              _nameController.clear();
                              vm.addName('');
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
                      imagePath: current.imagePath,
                      exerciseIndex: index,
                      note: current.notes,
                    );
                  }),
                  itemCount: state.exercises.length,
                  shrinkWrap: true,
                ),

                SizedBox(height: 10),
                state.exercises.isEmpty
                    ? SizedBox(
                        height: 100,
                        child: Center(
                          child: Text(
                            'Get started by adding a exercise to your\nsession.',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),

                LongCustomButton(
                  title: "+ Add Exercises",
                  onTap: () => context.push(
                    "/home/create_sessions/add_exercise",
                    extra: plannedSessionViewModelProvider,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
