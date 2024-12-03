import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'workout_goal.freezed.dart';
part 'workout_goal.g.dart';

@freezed
class WorkoutGoal with _$WorkoutGoal {
  const factory WorkoutGoal({
    required String id,
    required String title,
    required int targetCalories,
    required int targetMinutes,
    required DateTime deadline,
    @Default(false) bool isCompleted,
    @Default(0) int currentCalories,
    @Default(0) int currentMinutes,
  }) = _WorkoutGoal;

  factory WorkoutGoal.fromJson(Map<String, dynamic> json) => 
      _$WorkoutGoalFromJson(json);
      
  factory WorkoutGoal.create({
    required String title,
    required int targetCalories,
    required int targetMinutes,
    required DateTime deadline,
  }) {
    return WorkoutGoal(
      id: const Uuid().v4(),
      title: title,
      targetCalories: targetCalories,
      targetMinutes: targetMinutes,
      deadline: deadline,
    );
  }
} 