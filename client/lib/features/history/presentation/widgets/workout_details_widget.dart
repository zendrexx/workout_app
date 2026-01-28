import 'package:client/core/utils/format_number.dart';
import 'package:client/features/workout_logging/presentation/state/performed_set_state.dart';
import 'package:client/features/workout_planning/presentation/widgets/workout_set_widget.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsWidget extends StatelessWidget {
  final String name;
  final String imagePath;
  final String notes;
  final List<PerformedSetState> sets;

  const WorkoutDetailsWidget({
    super.key,
    required this.name,
    required this.imagePath,
    required this.notes,
    required this.sets,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                minRadius: 20,
                backgroundImage: AssetImage(imagePath),
              ),
              SizedBox(width: 16),
              Text(
                name,
                style: TextStyle(
                  color: Color(0xffD3C061),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            notes == "" ? "Notes Here" : notes,
            style: TextStyle(color: Color(0xff4E4E50), fontSize: 14),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Text(
                  "SETS",
                  style: TextStyle(fontSize: 12, color: Color(0xff4E4E50)),
                ),
              ),
              Expanded(
                child: Text(
                  "LBS",
                  style: TextStyle(fontSize: 12, color: Color(0xff4E4E50)),
                ),
              ),
              Expanded(
                child: Text(
                  "REP RANGE",
                  style: TextStyle(fontSize: 12, color: Color(0xff4E4E50)),
                ),
              ),
              Spacer(),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: sets.length,
            itemBuilder: (context, setIndex) {
              final set = sets[setIndex];
              String actWeight = formatDoubleNumber(set.actWeight);
              String actRep = formatDoubleNumber(set.actRep);
              return WorkoutSetWidget(
                index: 0,
                setNum: setIndex,
                estWeight: actWeight,
                viewing: true,
                repRange: actRep,
              );
            },
          ),
        ],
      ),
    );
  }
}
