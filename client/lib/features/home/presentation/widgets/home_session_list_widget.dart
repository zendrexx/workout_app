import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/home/presentation/providers/home_view_model_provider.dart';
import 'package:client/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:client/features/home/presentation/widgets/long_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeSessionListWidget extends ConsumerStatefulWidget {
  final String title;
  final String sessionId;

  const HomeSessionListWidget({
    super.key,
    required this.sessionId,
    required this.title,
  });

  @override
  ConsumerState<HomeSessionListWidget> createState() =>
      _HomeSessionListWidgetState();
}

class _HomeSessionListWidgetState extends ConsumerState<HomeSessionListWidget> {
  void _showSessionOptions(BuildContext context, HomeViewModel vm) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Appcolors.primaryColor,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Divider(height: 1, thickness: .2),
              ListTile(
                leading: const Icon(Icons.copy_outlined, color: Colors.white),
                title: const Text(
                  "Duplicate Session",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Create a copy you can edit",
                  style: TextStyle(color: Appcolors.muteText),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  vm.duplicateSession(widget.sessionId);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_outlined, color: Colors.white),
                title: const Text(
                  "Edit Session",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "Change exercises, sets and reps",
                  style: TextStyle(color: Appcolors.muteText),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  context.push(
                    '/home/create_sessions?sessionId=${widget.sessionId}',
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.delete_outline,
                  color: Color(0xffE2725B),
                ),
                title: const Text(
                  "Delete Session",
                  style: TextStyle(color: Color(0xffE2725B)),
                ),
                subtitle: const Text(
                  "Remove this session permanently",
                  style: TextStyle(color: Appcolors.muteText),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  vm.deleteSessionById(widget.sessionId);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(homeViewModelProvider.notifier);
    final state = ref.watch(homeViewModelProvider);
    final exercises = state.session
        .firstWhere((s) => s.sessionId == widget.sessionId)
        .exercises;

    final exerciseList = exercises
        .map((ex) => '${ex.exerciseName} (${ex.equipment})')
        .join(', ');

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          context.push('/home/view_session/${widget.sessionId}');
        }, // call your tap function
        borderRadius: BorderRadius.circular(3),
        splashColor: Colors.white.withOpacity(0.1), // light ripple
        highlightColor: Colors.white.withOpacity(0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff3B4141)),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title.toUpperCase(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),

                        IconButton(
                          onPressed: () => _showSessionOptions(context, vm),
                          padding: EdgeInsets.zero, // removes default padding
                          constraints: BoxConstraints(), // removes extra space
                          icon: Icon(
                            Icons.more_horiz,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      exerciseList,
                      maxLines: 2, // limit to 2 lines
                      overflow: TextOverflow.ellipsis, // show ... when overflow
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4, // optional for spacing
                      ),
                    ),

                    SizedBox(height: 10),
                    LongCustomButton(
                      title: "Start Session",
                      Bcolor: Appcolors.accent,
                      onTap: () => context.push(
                        '/home/log_workout?sessionId=${widget.sessionId}',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
