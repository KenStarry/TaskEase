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
  @HiveField(0, defaultValue: null)
  String? get boardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'board_name')
  @HiveField(1, defaultValue: null)
  String? get boardName => throw _privateConstructorUsedError;
  @JsonKey(name: 'board_description')
  @HiveField(2, defaultValue: null)
  String? get boardDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'board_hex')
  @HiveField(3, defaultValue: null)
  String? get boardHexColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'board_shared')
  @HiveField(4, defaultValue: false)
  bool get isBoardShared => throw _privateConstructorUsedError;
  @JsonKey(name: 'board_members')
  @HiveField(5, defaultValue: null)
  List<UserModel>? get boardMembers => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'board_id')
      @HiveField(0, defaultValue: null)
      String? boardId,
      @JsonKey(name: 'board_name')
      @HiveField(1, defaultValue: null)
      String? boardName,
      @JsonKey(name: 'board_description')
      @HiveField(2, defaultValue: null)
      String? boardDescription,
      @JsonKey(name: 'board_hex')
      @HiveField(3, defaultValue: null)
      String? boardHexColor,
      @JsonKey(name: 'board_shared')
      @HiveField(4, defaultValue: false)
      bool isBoardShared,
      @JsonKey(name: 'board_members')
      @HiveField(5, defaultValue: null)
      List<UserModel>? boardMembers});
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
    Object? isBoardShared = null,
    Object? boardMembers = freezed,
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
      isBoardShared: null == isBoardShared
          ? _value.isBoardShared
          : isBoardShared // ignore: cast_nullable_to_non_nullable
              as bool,
      boardMembers: freezed == boardMembers
          ? _value.boardMembers
          : boardMembers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
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
      {@JsonKey(name: 'board_id')
      @HiveField(0, defaultValue: null)
      String? boardId,
      @JsonKey(name: 'board_name')
      @HiveField(1, defaultValue: null)
      String? boardName,
      @JsonKey(name: 'board_description')
      @HiveField(2, defaultValue: null)
      String? boardDescription,
      @JsonKey(name: 'board_hex')
      @HiveField(3, defaultValue: null)
      String? boardHexColor,
      @JsonKey(name: 'board_shared')
      @HiveField(4, defaultValue: false)
      bool isBoardShared,
      @JsonKey(name: 'board_members')
      @HiveField(5, defaultValue: null)
      List<UserModel>? boardMembers});
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
    Object? isBoardShared = null,
    Object? boardMembers = freezed,
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
      isBoardShared: null == isBoardShared
          ? _value.isBoardShared
          : isBoardShared // ignore: cast_nullable_to_non_nullable
              as bool,
      boardMembers: freezed == boardMembers
          ? _value._boardMembers
          : boardMembers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BoardModelImpl implements _BoardModel {
  const _$BoardModelImpl(
      {@JsonKey(name: 'board_id')
      @HiveField(0, defaultValue: null)
      this.boardId = 'N/A',
      @JsonKey(name: 'board_name')
      @HiveField(1, defaultValue: null)
      this.boardName = 'N/A',
      @JsonKey(name: 'board_description')
      @HiveField(2, defaultValue: null)
      this.boardDescription = 'N/A',
      @JsonKey(name: 'board_hex')
      @HiveField(3, defaultValue: null)
      this.boardHexColor = 'N/A',
      @JsonKey(name: 'board_shared')
      @HiveField(4, defaultValue: false)
      this.isBoardShared = false,
      @JsonKey(name: 'board_members')
      @HiveField(5, defaultValue: null)
      final List<UserModel>? boardMembers = null})
      : _boardMembers = boardMembers;

  factory _$BoardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardModelImplFromJson(json);

  @override
  @JsonKey(name: 'board_id')
  @HiveField(0, defaultValue: null)
  final String? boardId;
  @override
  @JsonKey(name: 'board_name')
  @HiveField(1, defaultValue: null)
  final String? boardName;
  @override
  @JsonKey(name: 'board_description')
  @HiveField(2, defaultValue: null)
  final String? boardDescription;
  @override
  @JsonKey(name: 'board_hex')
  @HiveField(3, defaultValue: null)
  final String? boardHexColor;
  @override
  @JsonKey(name: 'board_shared')
  @HiveField(4, defaultValue: false)
  final bool isBoardShared;
  final List<UserModel>? _boardMembers;
  @override
  @JsonKey(name: 'board_members')
  @HiveField(5, defaultValue: null)
  List<UserModel>? get boardMembers {
    final value = _boardMembers;
    if (value == null) return null;
    if (_boardMembers is EqualUnmodifiableListView) return _boardMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BoardModel(boardId: $boardId, boardName: $boardName, boardDescription: $boardDescription, boardHexColor: $boardHexColor, isBoardShared: $isBoardShared, boardMembers: $boardMembers)';
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
                other.isBoardShared == isBoardShared) &&
            const DeepCollectionEquality()
                .equals(other._boardMembers, _boardMembers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      boardId,
      boardName,
      boardDescription,
      boardHexColor,
      isBoardShared,
      const DeepCollectionEquality().hash(_boardMembers));

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
      {@JsonKey(name: 'board_id')
      @HiveField(0, defaultValue: null)
      final String? boardId,
      @JsonKey(name: 'board_name')
      @HiveField(1, defaultValue: null)
      final String? boardName,
      @JsonKey(name: 'board_description')
      @HiveField(2, defaultValue: null)
      final String? boardDescription,
      @JsonKey(name: 'board_hex')
      @HiveField(3, defaultValue: null)
      final String? boardHexColor,
      @JsonKey(name: 'board_shared')
      @HiveField(4, defaultValue: false)
      final bool isBoardShared,
      @JsonKey(name: 'board_members')
      @HiveField(5, defaultValue: null)
      final List<UserModel>? boardMembers}) = _$BoardModelImpl;

  factory _BoardModel.fromJson(Map<String, dynamic> json) =
      _$BoardModelImpl.fromJson;

  @override
  @JsonKey(name: 'board_id')
  @HiveField(0, defaultValue: null)
  String? get boardId;
  @override
  @JsonKey(name: 'board_name')
  @HiveField(1, defaultValue: null)
  String? get boardName;
  @override
  @JsonKey(name: 'board_description')
  @HiveField(2, defaultValue: null)
  String? get boardDescription;
  @override
  @JsonKey(name: 'board_hex')
  @HiveField(3, defaultValue: null)
  String? get boardHexColor;
  @override
  @JsonKey(name: 'board_shared')
  @HiveField(4, defaultValue: false)
  bool get isBoardShared;
  @override
  @JsonKey(name: 'board_members')
  @HiveField(5, defaultValue: null)
  List<UserModel>? get boardMembers;

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardModelImplCopyWith<_$BoardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
