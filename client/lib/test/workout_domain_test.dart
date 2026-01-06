// import 'package:client/features/workout_planning/domain/entities/planned_workout_exercise.dart';
// import 'package:client/features/workout_planning/domain/entities/planned_workout_session.dart';
// import 'package:client/features/workout_planning/domain/entities/planned_workout_set.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('PlannedWorkoutSession domain tests', () {
//     test('isValid returns true for valid session', () {
//       final set1 = PlannedWorkoutSet(minRep: 8, maxRep: 12, estWeight: 50);
//       final exercise = PlannedWorkoutExercise(
//         exId: 'ex1',
//         exerciseName: 'Bench Press',
//         sets: [set1],
//       );
//       final session = PlannedWorkoutSession(
//         id: 's1',
//         name: 'Chest Day',
//         createdAt: DateTime.now(),
//         exercises: [exercise],
//       );

//       expect(session.isValid, true);
//       expect(session.getTotalSets, 1);
//       expect(session.getTotalEstVolume, set1.getEstVolume);
//     });

//     test('isValid returns false for empty name or no exercises', () {
//       final session1 = PlannedWorkoutSession(
//         id: 's2',
//         name: '',
//         createdAt: DateTime.now(),
//         exercises: [],
//       );

//       expect(session1.isValid, false);
//     });
//   });
// }
