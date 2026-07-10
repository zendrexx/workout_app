import 'package:client/features/workout_planning/data/mappers/domain_to_isar_session_mapper.dart';
import 'package:client/features/workout_planning/data/mappers/isar_to_domain_session_mapper.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Regression: toIsarSession used to drop exercises (and toIsarExercise used
  // to drop sets), so saved sessions always came back empty when viewed.
  test('session -> isar -> domain preserves exercises and sets', () {
    final session = PlannedWorkoutSession(
      sessionId: 'abc',
      name: 'Push Day',
      createdAt: DateTime(2026, 1, 1),
      exercises: [
        PlannedWorkoutExercise(
          exId: 'e1',
          exerciseName: 'Bench Press',
          imagePath: 'x.png',
          equipment: 'Barbell',
          notes: 'touch and go',
          sets: [
            PlannedWorkoutSet(minRep: 3, maxRep: 5, estWeight: 225),
            PlannedWorkoutSet(minRep: 8, maxRep: 10, estWeight: 185),
          ],
        ),
      ],
    );

    final roundTripped = toDomainSession(toIsarSession(session));

    expect(roundTripped.sessionId, 'abc');
    expect(roundTripped.name, 'Push Day');
    expect(roundTripped.exercises, hasLength(1));

    final exercise = roundTripped.exercises.single;
    expect(exercise.exerciseName, 'Bench Press');
    expect(exercise.equipment, 'Barbell');
    expect(exercise.sets, hasLength(2));
    expect(exercise.sets.first.minRep, 3);
    expect(exercise.sets.first.maxRep, 5);
    expect(exercise.sets.first.estWeight, 225);
  });
}
