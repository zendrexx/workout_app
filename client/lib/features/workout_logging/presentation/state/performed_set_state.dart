// ignore_for_file: public_member_api_docs, sort_constructors_first
class PerformedSetState {
  final String estRep;
  final double estWeight;
  final int actRep;
  final double actWeight;
  bool isCompleted;
  PerformedSetState({
    required this.estWeight,
    required this.estRep,
    required this.actRep,
    required this.actWeight,
    required this.isCompleted,
  });
  factory PerformedSetState.defaultSet() {
    return PerformedSetState(
      estRep: '0',
      estWeight: 0,
      actRep: 0,
      actWeight: 0,
      isCompleted: false,
    );
  }
  PerformedSetState copyWith({
    String? estRep,
    double? estWeight,
    int? actRep,
    double? actWeight,
    bool? isCompleted,
  }) {
    return PerformedSetState(
      estRep: estRep ?? this.estRep,
      estWeight: estWeight ?? this.estWeight,
      actRep: actRep ?? this.actRep,
      actWeight: actWeight ?? this.actWeight,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
