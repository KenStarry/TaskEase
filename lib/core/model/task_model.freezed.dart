// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  @JsonKey(name: 'task_id')
  @HiveField(0, defaultValue: null)
  String? get taskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_parent_id')
  @HiveField(1, defaultValue: null)
  String? get taskParentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_name')
  @HiveField(2, defaultValue: null)
  String? get taskName => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_description')
  @HiveField(3, defaultValue: null)
  String? get taskDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_complete')
  @HiveField(4, defaultValue: false)
  bool? get taskIsComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_board')
  @HiveField(5, defaultValue: null)
  String? get taskBoard => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_date')
  @HiveField(6, defaultValue: null)
  String? get taskDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_priority')
  @HiveField(7, defaultValue: null)
  int? get taskPriority => throw _privateConstructorUsedError;

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'task_id')
      @HiveField(0, defaultValue: null)
      String? taskId,
      @JsonKey(name: 'task_parent_id')
      @HiveField(1, defaultValue: null)
      String? taskParentId,
      @JsonKey(name: 'task_name')
      @HiveField(2, defaultValue: null)
      String? taskName,
      @JsonKey(name: 'task_description')
      @HiveField(3, defaultValue: null)
      String? taskDescription,
      @JsonKey(name: 'task_complete')
      @HiveField(4, defaultValue: false)
      bool? taskIsComplete,
      @JsonKey(name: 'task_board')
      @HiveField(5, defaultValue: null)
      String? taskBoard,
      @JsonKey(name: 'task_date')
      @HiveField(6, defaultValue: null)
      String? taskDate,
      @JsonKey(name: 'task_priority')
      @HiveField(7, defaultValue: null)
      int? taskPriority});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? taskParentId = freezed,
    Object? taskName = freezed,
    Object? taskDescription = freezed,
    Object? taskIsComplete = freezed,
    Object? taskBoard = freezed,
    Object? taskDate = freezed,
    Object? taskPriority = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      taskParentId: freezed == taskParentId
          ? _value.taskParentId
          : taskParentId // ignore: cast_nullable_to_non_nullable
              as String?,
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
      taskDescription: freezed == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      taskIsComplete: freezed == taskIsComplete
          ? _value.taskIsComplete
          : taskIsComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      taskBoard: freezed == taskBoard
          ? _value.taskBoard
          : taskBoard // ignore: cast_nullable_to_non_nullable
              as String?,
      taskDate: freezed == taskDate
          ? _value.taskDate
          : taskDate // ignore: cast_nullable_to_non_nullable
              as String?,
      taskPriority: freezed == taskPriority
          ? _value.taskPriority
          : taskPriority // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'task_id')
      @HiveField(0, defaultValue: null)
      String? taskId,
      @JsonKey(name: 'task_parent_id')
      @HiveField(1, defaultValue: null)
      String? taskParentId,
      @JsonKey(name: 'task_name')
      @HiveField(2, defaultValue: null)
      String? taskName,
      @JsonKey(name: 'task_description')
      @HiveField(3, defaultValue: null)
      String? taskDescription,
      @JsonKey(name: 'task_complete')
      @HiveField(4, defaultValue: false)
      bool? taskIsComplete,
      @JsonKey(name: 'task_board')
      @HiveField(5, defaultValue: null)
      String? taskBoard,
      @JsonKey(name: 'task_date')
      @HiveField(6, defaultValue: null)
      String? taskDate,
      @JsonKey(name: 'task_priority')
      @HiveField(7, defaultValue: null)
      int? taskPriority});
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? taskParentId = freezed,
    Object? taskName = freezed,
    Object? taskDescription = freezed,
    Object? taskIsComplete = freezed,
    Object? taskBoard = freezed,
    Object? taskDate = freezed,
    Object? taskPriority = freezed,
  }) {
    return _then(_$TaskModelImpl(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      taskParentId: freezed == taskParentId
          ? _value.taskParentId
          : taskParentId // ignore: cast_nullable_to_non_nullable
              as String?,
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
      taskDescription: freezed == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      taskIsComplete: freezed == taskIsComplete
          ? _value.taskIsComplete
          : taskIsComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      taskBoard: freezed == taskBoard
          ? _value.taskBoard
          : taskBoard // ignore: cast_nullable_to_non_nullable
              as String?,
      taskDate: freezed == taskDate
          ? _value.taskDate
          : taskDate // ignore: cast_nullable_to_non_nullable
              as String?,
      taskPriority: freezed == taskPriority
          ? _value.taskPriority
          : taskPriority // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TaskModelImpl implements _TaskModel {
  const _$TaskModelImpl(
      {@JsonKey(name: 'task_id')
      @HiveField(0, defaultValue: null)
      this.taskId = null,
      @JsonKey(name: 'task_parent_id')
      @HiveField(1, defaultValue: null)
      this.taskParentId = null,
      @JsonKey(name: 'task_name')
      @HiveField(2, defaultValue: null)
      this.taskName = null,
      @JsonKey(name: 'task_description')
      @HiveField(3, defaultValue: null)
      this.taskDescription = null,
      @JsonKey(name: 'task_complete')
      @HiveField(4, defaultValue: false)
      this.taskIsComplete = false,
      @JsonKey(name: 'task_board')
      @HiveField(5, defaultValue: null)
      this.taskBoard = null,
      @JsonKey(name: 'task_date')
      @HiveField(6, defaultValue: null)
      this.taskDate = null,
      @JsonKey(name: 'task_priority')
      @HiveField(7, defaultValue: null)
      this.taskPriority = null});

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  @JsonKey(name: 'task_id')
  @HiveField(0, defaultValue: null)
  final String? taskId;
  @override
  @JsonKey(name: 'task_parent_id')
  @HiveField(1, defaultValue: null)
  final String? taskParentId;
  @override
  @JsonKey(name: 'task_name')
  @HiveField(2, defaultValue: null)
  final String? taskName;
  @override
  @JsonKey(name: 'task_description')
  @HiveField(3, defaultValue: null)
  final String? taskDescription;
  @override
  @JsonKey(name: 'task_complete')
  @HiveField(4, defaultValue: false)
  final bool? taskIsComplete;
  @override
  @JsonKey(name: 'task_board')
  @HiveField(5, defaultValue: null)
  final String? taskBoard;
  @override
  @JsonKey(name: 'task_date')
  @HiveField(6, defaultValue: null)
  final String? taskDate;
  @override
  @JsonKey(name: 'task_priority')
  @HiveField(7, defaultValue: null)
  final int? taskPriority;

  @override
  String toString() {
    return 'TaskModel(taskId: $taskId, taskParentId: $taskParentId, taskName: $taskName, taskDescription: $taskDescription, taskIsComplete: $taskIsComplete, taskBoard: $taskBoard, taskDate: $taskDate, taskPriority: $taskPriority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.taskParentId, taskParentId) ||
                other.taskParentId == taskParentId) &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.taskDescription, taskDescription) ||
                other.taskDescription == taskDescription) &&
            (identical(other.taskIsComplete, taskIsComplete) ||
                other.taskIsComplete == taskIsComplete) &&
            (identical(other.taskBoard, taskBoard) ||
                other.taskBoard == taskBoard) &&
            (identical(other.taskDate, taskDate) ||
                other.taskDate == taskDate) &&
            (identical(other.taskPriority, taskPriority) ||
                other.taskPriority == taskPriority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, taskParentId, taskName,
      taskDescription, taskIsComplete, taskBoard, taskDate, taskPriority);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(
      this,
    );
  }
}

abstract class _TaskModel implements TaskModel {
  const factory _TaskModel(
      {@JsonKey(name: 'task_id')
      @HiveField(0, defaultValue: null)
      final String? taskId,
      @JsonKey(name: 'task_parent_id')
      @HiveField(1, defaultValue: null)
      final String? taskParentId,
      @JsonKey(name: 'task_name')
      @HiveField(2, defaultValue: null)
      final String? taskName,
      @JsonKey(name: 'task_description')
      @HiveField(3, defaultValue: null)
      final String? taskDescription,
      @JsonKey(name: 'task_complete')
      @HiveField(4, defaultValue: false)
      final bool? taskIsComplete,
      @JsonKey(name: 'task_board')
      @HiveField(5, defaultValue: null)
      final String? taskBoard,
      @JsonKey(name: 'task_date')
      @HiveField(6, defaultValue: null)
      final String? taskDate,
      @JsonKey(name: 'task_priority')
      @HiveField(7, defaultValue: null)
      final int? taskPriority}) = _$TaskModelImpl;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  @JsonKey(name: 'task_id')
  @HiveField(0, defaultValue: null)
  String? get taskId;
  @override
  @JsonKey(name: 'task_parent_id')
  @HiveField(1, defaultValue: null)
  String? get taskParentId;
  @override
  @JsonKey(name: 'task_name')
  @HiveField(2, defaultValue: null)
  String? get taskName;
  @override
  @JsonKey(name: 'task_description')
  @HiveField(3, defaultValue: null)
  String? get taskDescription;
  @override
  @JsonKey(name: 'task_complete')
  @HiveField(4, defaultValue: false)
  bool? get taskIsComplete;
  @override
  @JsonKey(name: 'task_board')
  @HiveField(5, defaultValue: null)
  String? get taskBoard;
  @override
  @JsonKey(name: 'task_date')
  @HiveField(6, defaultValue: null)
  String? get taskDate;
  @override
  @JsonKey(name: 'task_priority')
  @HiveField(7, defaultValue: null)
  int? get taskPriority;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
