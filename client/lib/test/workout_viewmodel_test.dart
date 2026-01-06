// import 'package:client/features/workout_planning/domain/usecases/create_workout_session.dart';
// import 'package:flutter_test/flutter_test.dart';

// // Mock use case
// class MockCreateWorkoutSession implements CreateWorkoutSession {
//   String? savedWorkoutName;

//   @override
//   Future<void> call(dynamic session) async {
//     savedWorkoutName = session.name;
//   }
// }

// void main() {
//   group('WorkoutViewModel tests', () {
//     late WorkoutViewModel vm;
//     late MockCreateWorkoutSession mockUseCase;

//     setUp(() {
//       mockUseCase = MockCreateWorkoutSession();
//       vm = WorkoutViewModel(mockUseCase);
//     });

//     test('initial state is empty', () {
//       expect(vm.state.name, '');
//       expect(vm.state.exercises.length, 0);
//     });

//     test('setName updates state', () {
//       vm.setName('Chest Day');
//       expect(vm.state.name, 'Chest Day');
//     });

//     test('addExercise updates state', () {
//       final exercise = WorkoutExercise(
//         id: 'ex1',
//         name: 'Bench Press',
//         type: ExerciseType.strength,
//         sets: [
//           WorkoutSet(reps: 10, weight: 50),
//         ],
//       );

//       vm.addExercise([exercise]);
//       expect(vm.state.exercises.length, 1);
//       expect(vm.state.exercises.first.name, 'Bench Press');
//     });

//     test('save calls use case with correct session', () async {
//       vm.setName('Chest Day');

//       final exercise = WorkoutExercise(
//         id: 'ex1',
//         name: 'Bench Press',
//         type: ExerciseType.strength,
//         sets: [
//           WorkoutSet(reps: 10, weight: 50),
//         ],
//       );

//       vm.addExercise([exercise]);
//       await vm.save();

//       expect(mockUseCase.savedWorkoutName, 'Chest Day');
//     });
//   });
// }
