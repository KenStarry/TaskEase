// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BoardModel _$BoardModelFromJson(Map<String, dynamic> json) {
  return _BoardModel.fromJson(json);
}

/// @nodoc
mixin _$BoardModel {
  @JsonKey(name: 'board_id')
  String? get boardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'board_name')
  String? get boardName => throw _privateConstructorUsedError;
  @JsonKey(name: 'board_description')
  String? get boardDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'board_hex')
  String? get boardHexColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'board_shared')
  bool? get isBoardShared => throw _privateConstructorUsedError;

  /// Serializes this BoardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardModelCopyWith<BoardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardModelCopyWith<$Res> {
  factory $BoardModelCopyWith(
          BoardModel value, $Res Function(BoardModel) then) =
      _$BoardModelCopyWithImpl<$Res, BoardModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'board_id') String? boardId,
      @JsonKey(name: 'board_name') String? boardName,
      @JsonKey(name: 'board_description') String? boardDescription,
      @JsonKey(name: 'board_hex') String? boardHexColor,
      @JsonKey(name: 'board_shared') bool? isBoardShared});
}

/// @nodoc
class _$BoardModelCopyWithImpl<$Res, $Val extends BoardModel>
    implements $BoardModelCopyWith<$Res> {
  _$BoardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardId = freezed,
    Object? boardName = freezed,
    Object? boardDescription = freezed,
    Object? boardHexColor = freezed,
    Object? isBoardShared = freezed,
  }) {
    return _then(_value.copyWith(
      boardId: freezed == boardId
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String?,
      boardName: freezed == boardName
          ? _value.boardName
          : boardName // ignore: cast_nullable_to_non_nullable
              as String?,
      boardDescription: freezed == boardDescription
          ? _value.boardDescription
          : boardDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      boardHexColor: freezed == boardHexColor
          ? _value.boardHexColor
          : boardHexColor // ignore: cast_nullable_to_non_nullable
              as String?,
      isBoardShared: freezed == isBoardShared
          ? _value.isBoardShared
          : isBoardShared // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardModelImplCopyWith<$Res>
    implements $BoardModelCopyWith<$Res> {
  factory _$$BoardModelImplCopyWith(
          _$BoardModelImpl value, $Res Function(_$BoardModelImpl) then) =
      __$$BoardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'board_id') String? boardId,
      @JsonKey(name: 'board_name') String? boardName,
      @JsonKey(name: 'board_description') String? boardDescription,
      @JsonKey(name: 'board_hex') String? boardHexColor,
      @JsonKey(name: 'board_shared') bool? isBoardShared});
}

/// @nodoc
class __$$BoardModelImplCopyWithImpl<$Res>
    extends _$BoardModelCopyWithImpl<$Res, _$BoardModelImpl>
    implements _$$BoardModelImplCopyWith<$Res> {
  __$$BoardModelImplCopyWithImpl(
      _$BoardModelImpl _value, $Res Function(_$BoardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardId = freezed,
    Object? boardName = freezed,
    Object? boardDescription = freezed,
    Object? boardHexColor = freezed,
    Object? isBoardShared = freezed,
  }) {
    return _then(_$BoardModelImpl(
      boardId: freezed == boardId
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String?,
      boardName: freezed == boardName
          ? _value.boardName
          : boardName // ignore: cast_nullable_to_non_nullable
              as String?,
      boardDescription: freezed == boardDescription
          ? _value.boardDescription
          : boardDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      boardHexColor: freezed == boardHexColor
          ? _value.boardHexColor
          : boardHexColor // ignore: cast_nullable_to_non_nullable
              as String?,
      isBoardShared: freezed == isBoardShared
          ? _value.isBoardShared
          : isBoardShared // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BoardModelImpl implements _BoardModel {
  const _$BoardModelImpl(
      {@JsonKey(name: 'board_id') this.boardId = 'N/A',
      @JsonKey(name: 'board_name') this.boardName = 'N/A',
      @JsonKey(name: 'board_description') this.boardDescription = 'N/A',
      @JsonKey(name: 'board_hex') this.boardHexColor = 'N/A',
      @JsonKey(name: 'board_shared') this.isBoardShared = false});

  factory _$BoardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardModelImplFromJson(json);

  @override
  @JsonKey(name: 'board_id')
  final String? boardId;
  @override
  @JsonKey(name: 'board_name')
  final String? boardName;
  @override
  @JsonKey(name: 'board_description')
  final String? boardDescription;
  @override
  @JsonKey(name: 'board_hex')
  final String? boardHexColor;
  @override
  @JsonKey(name: 'board_shared')
  final bool? isBoardShared;

  @override
  String toString() {
    return 'BoardModel(boardId: $boardId, boardName: $boardName, boardDescription: $boardDescription, boardHexColor: $boardHexColor, isBoardShared: $isBoardShared)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardModelImpl &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.boardName, boardName) ||
                other.boardName == boardName) &&
            (identical(other.boardDescription, boardDescription) ||
                other.boardDescription == boardDescription) &&
            (identical(other.boardHexColor, boardHexColor) ||
                other.boardHexColor == boardHexColor) &&
            (identical(other.isBoardShared, isBoardShared) ||
                other.isBoardShared == isBoardShared));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, boardId, boardName,
      boardDescription, boardHexColor, isBoardShared);

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardModelImplCopyWith<_$BoardModelImpl> get copyWith =>
      __$$BoardModelImplCopyWithImpl<_$BoardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardModelImplToJson(
      this,
    );
  }
}

abstract class _BoardModel implements BoardModel {
  const factory _BoardModel(
          {@JsonKey(name: 'board_id') final String? boardId,
          @JsonKey(name: 'board_name') final String? boardName,
          @JsonKey(name: 'board_description') final String? boardDescription,
          @JsonKey(name: 'board_hex') final String? boardHexColor,
          @JsonKey(name: 'board_shared') final bool? isBoardShared}) =
      _$BoardModelImpl;

  factory _BoardModel.fromJson(Map<String, dynamic> json) =
      _$BoardModelImpl.fromJson;

  @override
  @JsonKey(name: 'board_id')
  String? get boardId;
  @override
  @JsonKey(name: 'board_name')
  String? get boardName;
  @override
  @JsonKey(name: 'board_description')
  String? get boardDescription;
  @override
  @JsonKey(name: 'board_hex')
  String? get boardHexColor;
  @override
  @JsonKey(name: 'board_shared')
  bool? get isBoardShared;

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardModelImplCopyWith<_$BoardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
