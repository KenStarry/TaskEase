// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_priority_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskPriorityModel _$TaskPriorityModelFromJson(Map<String, dynamic> json) {
  return _TaskPriorityModel.fromJson(json);
}

/// @nodoc
mixin _$TaskPriorityModel {
  @JsonKey(name: 'name')
  @HiveField(0, defaultValue: null)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  @HiveField(1, defaultValue: null)
  String? get color => throw _privateConstructorUsedError;

  /// Serializes this TaskPriorityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskPriorityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskPriorityModelCopyWith<TaskPriorityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskPriorityModelCopyWith<$Res> {
  factory $TaskPriorityModelCopyWith(
          TaskPriorityModel value, $Res Function(TaskPriorityModel) then) =
      _$TaskPriorityModelCopyWithImpl<$Res, TaskPriorityModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') @HiveField(0, defaultValue: null) String? name,
      @JsonKey(name: 'color') @HiveField(1, defaultValue: null) String? color});
}

/// @nodoc
class _$TaskPriorityModelCopyWithImpl<$Res, $Val extends TaskPriorityModel>
    implements $TaskPriorityModelCopyWith<$Res> {
  _$TaskPriorityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskPriorityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskPriorityModelImplCopyWith<$Res>
    implements $TaskPriorityModelCopyWith<$Res> {
  factory _$$TaskPriorityModelImplCopyWith(_$TaskPriorityModelImpl value,
          $Res Function(_$TaskPriorityModelImpl) then) =
      __$$TaskPriorityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') @HiveField(0, defaultValue: null) String? name,
      @JsonKey(name: 'color') @HiveField(1, defaultValue: null) String? color});
}

/// @nodoc
class __$$TaskPriorityModelImplCopyWithImpl<$Res>
    extends _$TaskPriorityModelCopyWithImpl<$Res, _$TaskPriorityModelImpl>
    implements _$$TaskPriorityModelImplCopyWith<$Res> {
  __$$TaskPriorityModelImplCopyWithImpl(_$TaskPriorityModelImpl _value,
      $Res Function(_$TaskPriorityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskPriorityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
  }) {
    return _then(_$TaskPriorityModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TaskPriorityModelImpl implements _TaskPriorityModel {
  const _$TaskPriorityModelImpl(
      {@JsonKey(name: 'name')
      @HiveField(0, defaultValue: null)
      this.name = 'N/A',
      @JsonKey(name: 'color')
      @HiveField(1, defaultValue: null)
      this.color = 'N/A'});

  factory _$TaskPriorityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskPriorityModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  @HiveField(0, defaultValue: null)
  final String? name;
  @override
  @JsonKey(name: 'color')
  @HiveField(1, defaultValue: null)
  final String? color;

  @override
  String toString() {
    return 'TaskPriorityModel(name: $name, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskPriorityModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  /// Create a copy of TaskPriorityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskPriorityModelImplCopyWith<_$TaskPriorityModelImpl> get copyWith =>
      __$$TaskPriorityModelImplCopyWithImpl<_$TaskPriorityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskPriorityModelImplToJson(
      this,
    );
  }
}

abstract class _TaskPriorityModel implements TaskPriorityModel {
  const factory _TaskPriorityModel(
      {@JsonKey(name: 'name')
      @HiveField(0, defaultValue: null)
      final String? name,
      @JsonKey(name: 'color')
      @HiveField(1, defaultValue: null)
      final String? color}) = _$TaskPriorityModelImpl;

  factory _TaskPriorityModel.fromJson(Map<String, dynamic> json) =
      _$TaskPriorityModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  @HiveField(0, defaultValue: null)
  String? get name;
  @override
  @JsonKey(name: 'color')
  @HiveField(1, defaultValue: null)
  String? get color;

  /// Create a copy of TaskPriorityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskPriorityModelImplCopyWith<_$TaskPriorityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
