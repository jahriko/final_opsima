// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      caloriesBurned: (json['caloriesBurned'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      type: $enumDecodeNullable(_$WorkoutTypeEnumMap, json['type']) ??
          WorkoutType.other,
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'durationMinutes': instance.durationMinutes,
      'caloriesBurned': instance.caloriesBurned,
      'date': instance.date.toIso8601String(),
      'type': _$WorkoutTypeEnumMap[instance.type]!,
    };

const _$WorkoutTypeEnumMap = {
  WorkoutType.running: 'running',
  WorkoutType.cycling: 'cycling',
  WorkoutType.swimming: 'swimming',
  WorkoutType.weightLifting: 'weightLifting',
  WorkoutType.yoga: 'yoga',
  WorkoutType.other: 'other',
};
