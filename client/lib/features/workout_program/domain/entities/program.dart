// ignore_for_file: public_member_api_docs, sort_constructors_first
class Program {
  String programId;

  String name;
  List<String> sessionIds;
  Program({
    required this.programId,
    required this.name,
    required this.sessionIds,
  });
  bool get hasName {
    return name.trim().isNotEmpty;
  }

  bool get hasSessionIds {
    return sessionIds.isNotEmpty;
  }

  Program copyWith({
    String? programId,
    String? name,
    List<String>? sessionIds,
  }) {
    return Program(
      programId: programId ?? this.programId,
      name: name ?? this.name,
      sessionIds: sessionIds ?? this.sessionIds,
    );
  }
}
