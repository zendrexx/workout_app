// ignore_for_file: public_member_api_docs, sort_constructors_first
class PerformedSetState {
  final String estRep;
  final double estWeight;
  final int actRep;
  final double actWeight;
  PerformedSetState({
    required this.estWeight,
    required this.estRep,
    required this.actRep,
    required this.actWeight,
  });

  PerformedSetState copyWith({
    String? estRep,
    double? estWeight,
    int? actRep,
    double? actWeight,
  }) {
    return PerformedSetState(
      estRep: estRep ?? this.estRep,
      estWeight: estWeight ?? this.estWeight,
      actRep: actRep ?? this.actRep,
      actWeight: actWeight ?? this.actWeight,
    );
  }
}
