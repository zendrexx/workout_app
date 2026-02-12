import 'dart:async';

import 'package:client/features/home/presentation/widgets/long_custom_button.dart';
import 'package:client/features/workout_program/presentation/events/program_ui_event.dart';
import 'package:client/features/workout_program/presentation/widgets/session_card_widget.dart';
import 'package:client/features/workout_program/presentation/providers/program_view_model_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProgramPage extends ConsumerStatefulWidget {
  final String? programId;
  const ProgramPage({super.key, this.programId});

  @override
  ConsumerState<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends ConsumerState<ProgramPage> {
  bool isEditMode = false;
  void cancel() {
    context.push('/home');
    ref.invalidate(programViewModelProvider);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  late final StreamSubscription<ProgramUiEvent> _subscription;
  @override
  void initState() {
    super.initState();

    if (widget.programId != null) {
      isEditMode = true;
      Future.microtask(() {
        ref
            .read(programViewModelProvider.notifier)
            .loadProgramById(widget.programId!);
      });
    }

    _subscription = ref.read(programViewModelProvider.notifier).events.listen((
      event,
    ) {
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

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(programViewModelProvider);
    final vm = ref.watch(programViewModelProvider.notifier);
    _controller.text = state.programName;
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            isEditMode ? "Edit Program" : "Create Program",
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name'; // red text + border
                    }

                    return null; // ✅ no error
                  },
                  cursorColor: Colors.white,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Program Name",
                    suffixIcon: _controller.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.white),
                            onPressed: () {
                              _controller.clear();
                              vm.addName('');
                            },
                          )
                        : null,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),

                    // Border when focused
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  onChanged: (value) {
                    vm.addName(value);
                  },
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.programSessions.length,
                  itemBuilder: (context, index) {
                    final session = state.programSessions[index];
                    return GestureDetector(
                      child: SessionCardWidget(
                        isSelectable: false,
                        sessionName: session.name,
                        exercises: session.exercises,
                        sessionId: session.sessionId,
                        index: index,
                      ),
                    );
                  },
                ),
                state.programSessions.isEmpty
                    ? SizedBox(
                        height: 100,
                        child: Center(
                          child: Text(
                            'Get started by adding a session to your\nprogram.',
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
                  title: "Add Sessions",
                  onTap: () => context.push('/home/program/select_session'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
