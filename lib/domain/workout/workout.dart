import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
class Workout with _$Workout {
  const factory Workout({
    required String id,
    required String name,
    required int durationMinutes,
    required int caloriesBurned,
    required DateTime date,
    @Default(WorkoutType.other) WorkoutType type,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
}

enum WorkoutType {
  running,
  cycling,
  swimming,
  weightLifting,
  yoga,
  other,
} 