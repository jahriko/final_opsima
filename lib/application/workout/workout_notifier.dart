import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tla_1_2_opsima/domain/workout/workout.dart';

part 'workout_notifier.g.dart';

@riverpod
class WorkoutNotifier extends _$WorkoutNotifier {
  @override
  List<Workout> build() => [];

  void addWorkout(Workout workout) {
    state = [...state, workout];
  }

  void removeWorkout(String id) {
    state = state.where((workout) => workout.id != id).toList();
  }

  int get totalCaloriesBurned =>
      state.fold(0, (sum, workout) => sum + workout.caloriesBurned);

  int get totalMinutesWorkedOut =>
      state.fold(0, (sum, workout) => sum + workout.durationMinutes);
} 