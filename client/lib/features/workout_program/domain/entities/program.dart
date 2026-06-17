// ignore_for_file: public_member_api_docs, sort_constructors_first
class Program {
  final String programId;
  final String name;

  const Program({required this.programId, required this.name});

  bool get hasName => name.trim().isNotEmpty;

  Program copyWith({String? programId, String? name}) {
    return Program(
      programId: programId ?? this.programId,
      name: name ?? this.name,
    );
  }
}
