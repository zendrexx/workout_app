// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/features/workout_program/domain/entities/week.dart';
import 'package:client/features/workout_program/presentation/state/week_program_state.dart';

class Program {
  final String programId;
  final String name;
  final List<Week> week;

  const Program({
    required this.programId,
    required this.name,
    required this.week,
  });

  bool get hasName => name.trim().isNotEmpty;

  Program copyWith({String? programId, String? name, final List<Week>? week}) {
    return Program(
      programId: programId ?? this.programId,
      name: name ?? this.name,
      week: week ?? this.week,
    );
  }
}
