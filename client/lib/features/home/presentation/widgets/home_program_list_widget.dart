import 'package:client/features/home/presentation/providers/home_view_model_provider.dart';
import 'package:client/features/home/presentation/widgets/long_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeProgramListWidget extends ConsumerStatefulWidget {
  final String title;
  final String programId;
  final String text;
  const HomeProgramListWidget({
    super.key,
    required this.programId,
    required this.title,
    required this.text,
  });

  @override
  ConsumerState<HomeProgramListWidget> createState() =>
      _HomeProgramListWidgetState();
}

class _HomeProgramListWidgetState extends ConsumerState<HomeProgramListWidget> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.read(homeViewModelProvider.notifier);
    //final state = ref.watch(homeViewModelProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          context.push('/home/view_program/${widget.programId}');
        },
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
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 300,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        child: Container(
                                          width: 100,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        widget.title,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Divider(thickness: .2),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0,
                                        ),

                                        child: Container(
                                          height: 170,
                                          decoration: BoxDecoration(
                                            color: Color(0xff2A2A2A),
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // vm.duplicateProgram(
                                                    //   widget.programId,
                                                    // );
                                                    Navigator.pop(context);
                                                  },
                                                  behavior:
                                                      HitTestBehavior.opaque,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "Duplicate Program",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Divider(thickness: .2),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    context.push(
                                                      '/home/program?programId=${widget.programId}',
                                                    );

                                                    Navigator.pop(context);
                                                  },
                                                  behavior:
                                                      HitTestBehavior.opaque,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "Edit Program",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Divider(thickness: .2),
                                              Expanded(
                                                child: GestureDetector(
                                                  behavior:
                                                      HitTestBehavior.opaque,
                                                  onTap: () {
                                                    vm.deleteProgram(
                                                      widget.programId,
                                                    );

                                                    Navigator.pop(context);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "Delete Program",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                            0xff9A1A1A,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              backgroundColor: Color(0xff131313),
                              useRootNavigator: true,
                            );
                          },
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
                      widget.text,
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
                      title: "Start Program",

                      onTap: () => vm.startProgram(widget.programId),
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
