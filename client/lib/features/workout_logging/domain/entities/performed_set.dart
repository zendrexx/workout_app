// ignore_for_file: public_member_api_docs, sort_constructors_first
class PerformedSet {
  final String estRep;
  final double estWeight;
  final int actRep;
  final double actWeight;
  //final double prevWeight;
  final bool isCompleted;
  final String setId;

  PerformedSet({
    required this.estRep,
    required this.estWeight,
    required this.actRep,
    required this.actWeight,
    //required this.prevWeight,
    required this.isCompleted,
    required this.setId,
  });
}
