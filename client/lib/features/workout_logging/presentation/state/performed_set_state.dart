// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/core/utils/id_generator.dart';

class PerformedSetState {
  final String estRep;
  final double estWeight;
  final int actRep;
  final double actWeight;
  //final double prevWeight;
  /// Rate of Perceived Exertion (1-10, half-steps allowed, e.g. 8.5). Optional
  /// — a set can be completed without recording one.
  final double? actRpe;
  bool isCompleted;
  PerformedSetState({
    required this.estWeight,
    required this.estRep,
    required this.actRep,
    required this.actWeight,
    //required this.prevWeight,
    this.actRpe,
    required this.isCompleted,
  });
  factory PerformedSetState.defaultSet() {
    return PerformedSetState(
      estRep: '0',
      estWeight: 0,
      actRep: 0,
      actWeight: 0,
      //prevWeight: 0,
      actRpe: null,
      isCompleted: false,
    );
  }
  PerformedSetState copyWith({
    String? estRep,
    double? estWeight,
    int? actRep,
    double? actWeight,
    //double? prevWeight,
    double? actRpe,
    bool? isCompleted,
    String? setId,
  }) {
    return PerformedSetState(
      estRep: estRep ?? this.estRep,
      estWeight: estWeight ?? this.estWeight,
      actRep: actRep ?? this.actRep,
      actWeight: actWeight ?? this.actWeight,
      //prevWeight: prevWeight ?? this.prevWeight,
      actRpe: actRpe ?? this.actRpe,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
