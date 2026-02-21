// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/core/utils/id_generator.dart';

class PerformedSetState {
  final String estRep;
  final double estWeight;
  final int actRep;
  final double actWeight;
  final String setId;
  //final double prevWeight;
  bool isCompleted;
  PerformedSetState({
    required this.estWeight,
    required this.estRep,
    required this.actRep,
    required this.actWeight,
    //required this.prevWeight,
    required this.isCompleted,
    required this.setId,
  });
  factory PerformedSetState.defaultSet() {
    return PerformedSetState(
      estRep: '0',
      estWeight: 0,
      actRep: 0,
      actWeight: 0,
      //prevWeight: 0,
      isCompleted: false,
      setId: IdGenerator().getId(),
    );
  }
  PerformedSetState copyWith({
    String? estRep,
    double? estWeight,
    int? actRep,
    double? actWeight,
    //double? prevWeight,
    bool? isCompleted,
    String? setId,
  }) {
    return PerformedSetState(
      estRep: estRep ?? this.estRep,
      estWeight: estWeight ?? this.estWeight,
      actRep: actRep ?? this.actRep,
      actWeight: actWeight ?? this.actWeight,
      //prevWeight: prevWeight ?? this.prevWeight,
      isCompleted: isCompleted ?? this.isCompleted,
      setId: setId ?? this.setId,
    );
  }
}
