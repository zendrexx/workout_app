class ActiveProgram {
  final String activeProgramId;

  /// References [Program.programId] of the template being followed.
  final String templateProgramId;

  final int currentWeek;
  final int currentDay;
  final DateTime startedAt;
  final bool isCompleted;

  const ActiveProgram({
    required this.activeProgramId,
    required this.templateProgramId,
    required this.currentWeek,
    required this.currentDay,
    required this.startedAt,
    this.isCompleted = false,
  });

  ActiveProgram copyWith({
    String? activeProgramId,
    String? templateProgramId,
    int? currentWeek,
    int? currentDay,
    DateTime? startedAt,
    bool? isCompleted,
  }) {
    return ActiveProgram(
      activeProgramId: activeProgramId ?? this.activeProgramId,
      templateProgramId: templateProgramId ?? this.templateProgramId,
      currentWeek: currentWeek ?? this.currentWeek,
      currentDay: currentDay ?? this.currentDay,
      startedAt: startedAt ?? this.startedAt,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
