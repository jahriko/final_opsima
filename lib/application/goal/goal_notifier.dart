import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tla_1_2_opsima/domain/goal/workout_goal.dart';
import 'package:tla_1_2_opsima/domain/workout/workout.dart';

part 'goal_notifier.g.dart';

@riverpod
class GoalNotifier extends _$GoalNotifier {
  @override
  List<WorkoutGoal> build() => [];

  void addGoal(WorkoutGoal goal) {
    state = [...state, goal];
  }

  void removeGoal(String id) {
    state = state.where((goal) => goal.id != id).toList();
  }

  void updateGoalProgress(Workout workout) {
    state = state.map((goal) {
      if (!goal.isCompleted && goal.deadline.isAfter(DateTime.now())) {
        final newCalories = goal.currentCalories + workout.caloriesBurned;
        final newMinutes = goal.currentMinutes + workout.durationMinutes;
        
        return goal.copyWith(
          currentCalories: newCalories,
          currentMinutes: newMinutes,
          isCompleted: newCalories >= goal.targetCalories && 
                      newMinutes >= goal.targetMinutes,
        );
      }
      return goal;
    }).toList();
  }

  List<WorkoutGoal> get activeGoals => state.where(
    (goal) => !goal.isCompleted && goal.deadline.isAfter(DateTime.now())
  ).toList();

  List<WorkoutGoal> get completedGoals => state.where(
    (goal) => goal.isCompleted
  ).toList();

  List<WorkoutGoal> get expiredGoals => state.where(
    (goal) => !goal.isCompleted && goal.deadline.isBefore(DateTime.now())
  ).toList();
} 