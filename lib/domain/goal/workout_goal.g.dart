// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutGoalImpl _$$WorkoutGoalImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutGoalImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      targetCalories: (json['targetCalories'] as num).toInt(),
      targetMinutes: (json['targetMinutes'] as num).toInt(),
      deadline: DateTime.parse(json['deadline'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
      currentCalories: (json['currentCalories'] as num?)?.toInt() ?? 0,
      currentMinutes: (json['currentMinutes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$WorkoutGoalImplToJson(_$WorkoutGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'targetCalories': instance.targetCalories,
      'targetMinutes': instance.targetMinutes,
      'deadline': instance.deadline.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'currentCalories': instance.currentCalories,
      'currentMinutes': instance.currentMinutes,
    };
