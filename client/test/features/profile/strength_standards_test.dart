import 'package:client/features/profile/domain/entities/lift_record.dart';
import 'package:client/features/profile/domain/entities/record_lift.dart';
import 'package:client/features/profile/domain/entities/strength_level.dart';
import 'package:client/features/profile/domain/services/one_rep_max.dart';
import 'package:client/features/profile/domain/services/strength_standards.dart';
import 'package:flutter_test/flutter_test.dart';

LiftRecord _record(RecordLift lift, double oneRm) {
  return LiftRecord(
    lift: lift,
    weightLbs: oneRm,
    reps: 1,
    estimatedOneRmLbs: oneRm,
    achievedAt: null,
    fromLog: false,
  );
}

void main() {
  group('estimateOneRepMax', () {
    test('a single is its own max', () {
      expect(estimateOneRepMax(weightLbs: 300, reps: 1), 300);
    });

    test('applies Epley for rep sets', () {
      expect(estimateOneRepMax(weightLbs: 300, reps: 5), 350);
    });

    test('caps grading at 12 reps', () {
      expect(
        estimateOneRepMax(weightLbs: 100, reps: 20),
        estimateOneRepMax(weightLbs: 100, reps: 12),
      );
    });

    test('rejects nonsense input', () {
      expect(estimateOneRepMax(weightLbs: 0, reps: 5), 0);
      expect(estimateOneRepMax(weightLbs: 100, reps: 0), 0);
    });
  });

  group('StrengthStandards.assessLift', () {
    test('grades an untrained squat below the first threshold', () {
      final result = StrengthStandards.assessLift(
        lift: RecordLift.squat,
        oneRmLbs: 100,
        bodyWeightLbs: 200,
      )!;
      expect(result.level, StrengthLevel.untrained);
      expect(result.score, lessThan(1));
    });

    test('a ratio exactly on a threshold enters that level', () {
      final result = StrengthStandards.assessLift(
        lift: RecordLift.squat,
        oneRmLbs: 150, // 0.75x of 200 = novice threshold
        bodyWeightLbs: 200,
      )!;
      expect(result.level, StrengthLevel.novice);
      expect(result.score, closeTo(1.0, 1e-9));
    });

    test('elite is reached at the top threshold and pinned there', () {
      final result = StrengthStandards.assessLift(
        lift: RecordLift.squat,
        oneRmLbs: 600, // 3.0x of 200, above elite 2.5x
        bodyWeightLbs: 200,
      )!;
      expect(result.level, StrengthLevel.elite);
      expect(result.score, 5);
      expect(result.lbsToNextLevel, isNull);
    });

    test('reports the pounds missing to the next level', () {
      final result = StrengthStandards.assessLift(
        lift: RecordLift.benchPress,
        oneRmLbs: 160, // 0.8x of 200: beginner (0.75), next is 1.10x = 220
        bodyWeightLbs: 200,
      )!;
      expect(result.level, StrengthLevel.beginner);
      expect(result.lbsToNextLevel, closeTo(60, 1e-9));
    });

    test('has no standards for supporting lifts', () {
      expect(
        StrengthStandards.assessLift(
          lift: RecordLift.barbellRow,
          oneRmLbs: 200,
          bodyWeightLbs: 200,
        ),
        isNull,
      );
    });
  });

  group('StrengthStandards.assess', () {
    test('returns null with no competition lifts', () {
      expect(
        StrengthStandards.assess(records: [], bodyWeightLbs: 200),
        isNull,
      );
      expect(
        StrengthStandards.assess(
          records: [_record(RecordLift.overheadPress, 135)],
          bodyWeightLbs: 200,
        ),
        isNull,
      );
    });

    test('averages competition lifts and names the weakest', () {
      final assessment = StrengthStandards.assess(
        records: [
          _record(RecordLift.squat, 400), // 2.0x -> advanced (score 4)
          _record(RecordLift.benchPress, 220), // 1.1x -> intermediate (3)
          _record(RecordLift.deadlift, 450), // 2.25x -> advanced (4)
        ],
        bodyWeightLbs: 200,
      )!;

      expect(assessment.score, closeTo((4 + 3 + 4) / 3, 1e-9));
      expect(assessment.level, StrengthLevel.intermediate);
      expect(assessment.weakest.lift, RecordLift.benchPress);
      expect(assessment.missingLifts, isEmpty);
      // Strongest first.
      expect(assessment.lifts.first.score >= assessment.lifts.last.score,
          isTrue);
    });

    test('lists missing competition lifts', () {
      final assessment = StrengthStandards.assess(
        records: [_record(RecordLift.squat, 300)],
        bodyWeightLbs: 200,
      )!;
      expect(
        assessment.missingLifts,
        [RecordLift.benchPress, RecordLift.deadlift],
      );
    });
  });
}
