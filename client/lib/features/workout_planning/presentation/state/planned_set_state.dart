// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlannedSetState {
  final int? minRep;
  final int? maxRep;
  final double? estWeight;

  PlannedSetState({this.minRep, this.maxRep, this.estWeight});

  PlannedSetState copyWith({int? minRep, int? maxRep, double? estWeight}) {
    return PlannedSetState(
      minRep: minRep ?? this.minRep,
      maxRep: maxRep ?? this.maxRep,
      estWeight: estWeight ?? this.estWeight,
    );
  }
}
