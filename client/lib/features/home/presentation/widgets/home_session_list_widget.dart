import 'package:client/core/constants/AppColors.dart';
import 'package:client/features/home/presentation/providers/home_view_model_provider.dart';
import 'package:client/features/home/presentation/viewmodel/home_view_model.dart';
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
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        color: Appcolors.primaryColor,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: () {
            context.push('/home/view_session/${widget.sessionId}');
          },
          borderRadius: BorderRadius.circular(5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Appcolors.secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.fitness_center_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        exerciseList,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Appcolors.muteText,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Material(
                  color: Appcolors.accent,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => context.push(
                      '/home/log_workout?sessionId=${widget.sessionId}',
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  onPressed: () => _showSessionOptions(context, vm),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: Appcolors.muteText,
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
