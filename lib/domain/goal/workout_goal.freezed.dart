// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutGoal _$WorkoutGoalFromJson(Map<String, dynamic> json) {
  return _WorkoutGoal.fromJson(json);
}

/// @nodoc
mixin _$WorkoutGoal {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get targetCalories => throw _privateConstructorUsedError;
  int get targetMinutes => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  int get currentCalories => throw _privateConstructorUsedError;
  int get currentMinutes => throw _privateConstructorUsedError;

  /// Serializes this WorkoutGoal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutGoalCopyWith<WorkoutGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutGoalCopyWith<$Res> {
  factory $WorkoutGoalCopyWith(
          WorkoutGoal value, $Res Function(WorkoutGoal) then) =
      _$WorkoutGoalCopyWithImpl<$Res, WorkoutGoal>;
  @useResult
  $Res call(
      {String id,
      String title,
      int targetCalories,
      int targetMinutes,
      DateTime deadline,
      bool isCompleted,
      int currentCalories,
      int currentMinutes});
}

/// @nodoc
class _$WorkoutGoalCopyWithImpl<$Res, $Val extends WorkoutGoal>
    implements $WorkoutGoalCopyWith<$Res> {
  _$WorkoutGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? targetCalories = null,
    Object? targetMinutes = null,
    Object? deadline = null,
    Object? isCompleted = null,
    Object? currentCalories = null,
    Object? currentMinutes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      targetCalories: null == targetCalories
          ? _value.targetCalories
          : targetCalories // ignore: cast_nullable_to_non_nullable
              as int,
      targetMinutes: null == targetMinutes
          ? _value.targetMinutes
          : targetMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      currentCalories: null == currentCalories
          ? _value.currentCalories
          : currentCalories // ignore: cast_nullable_to_non_nullable
              as int,
      currentMinutes: null == currentMinutes
          ? _value.currentMinutes
          : currentMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutGoalImplCopyWith<$Res>
    implements $WorkoutGoalCopyWith<$Res> {
  factory _$$WorkoutGoalImplCopyWith(
          _$WorkoutGoalImpl value, $Res Function(_$WorkoutGoalImpl) then) =
      __$$WorkoutGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      int targetCalories,
      int targetMinutes,
      DateTime deadline,
      bool isCompleted,
      int currentCalories,
      int currentMinutes});
}

/// @nodoc
class __$$WorkoutGoalImplCopyWithImpl<$Res>
    extends _$WorkoutGoalCopyWithImpl<$Res, _$WorkoutGoalImpl>
    implements _$$WorkoutGoalImplCopyWith<$Res> {
  __$$WorkoutGoalImplCopyWithImpl(
      _$WorkoutGoalImpl _value, $Res Function(_$WorkoutGoalImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? targetCalories = null,
    Object? targetMinutes = null,
    Object? deadline = null,
    Object? isCompleted = null,
    Object? currentCalories = null,
    Object? currentMinutes = null,
  }) {
    return _then(_$WorkoutGoalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      targetCalories: null == targetCalories
          ? _value.targetCalories
          : targetCalories // ignore: cast_nullable_to_non_nullable
              as int,
      targetMinutes: null == targetMinutes
          ? _value.targetMinutes
          : targetMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      currentCalories: null == currentCalories
          ? _value.currentCalories
          : currentCalories // ignore: cast_nullable_to_non_nullable
              as int,
      currentMinutes: null == currentMinutes
          ? _value.currentMinutes
          : currentMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutGoalImpl implements _WorkoutGoal {
  const _$WorkoutGoalImpl(
      {required this.id,
      required this.title,
      required this.targetCalories,
      required this.targetMinutes,
      required this.deadline,
      this.isCompleted = false,
      this.currentCalories = 0,
      this.currentMinutes = 0});

  factory _$WorkoutGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutGoalImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final int targetCalories;
  @override
  final int targetMinutes;
  @override
  final DateTime deadline;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final int currentCalories;
  @override
  @JsonKey()
  final int currentMinutes;

  @override
  String toString() {
    return 'WorkoutGoal(id: $id, title: $title, targetCalories: $targetCalories, targetMinutes: $targetMinutes, deadline: $deadline, isCompleted: $isCompleted, currentCalories: $currentCalories, currentMinutes: $currentMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutGoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.targetCalories, targetCalories) ||
                other.targetCalories == targetCalories) &&
            (identical(other.targetMinutes, targetMinutes) ||
                other.targetMinutes == targetMinutes) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.currentCalories, currentCalories) ||
                other.currentCalories == currentCalories) &&
            (identical(other.currentMinutes, currentMinutes) ||
                other.currentMinutes == currentMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, targetCalories,
      targetMinutes, deadline, isCompleted, currentCalories, currentMinutes);

  /// Create a copy of WorkoutGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutGoalImplCopyWith<_$WorkoutGoalImpl> get copyWith =>
      __$$WorkoutGoalImplCopyWithImpl<_$WorkoutGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutGoalImplToJson(
      this,
    );
  }
}

abstract class _WorkoutGoal implements WorkoutGoal {
  const factory _WorkoutGoal(
      {required final String id,
      required final String title,
      required final int targetCalories,
      required final int targetMinutes,
      required final DateTime deadline,
      final bool isCompleted,
      final int currentCalories,
      final int currentMinutes}) = _$WorkoutGoalImpl;

  factory _WorkoutGoal.fromJson(Map<String, dynamic> json) =
      _$WorkoutGoalImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  int get targetCalories;
  @override
  int get targetMinutes;
  @override
  DateTime get deadline;
  @override
  bool get isCompleted;
  @override
  int get currentCalories;
  @override
  int get currentMinutes;

  /// Create a copy of WorkoutGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutGoalImplCopyWith<_$WorkoutGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
