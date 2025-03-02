import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:task_ease/features/auth/domain/model/user_model.dart';

part 'board_model.freezed.dart';

part 'board_model.g.dart';

@freezed
@HiveType(typeId: 1)
class BoardModel with _$BoardModel {
  @JsonSerializable(explicitToJson: true)
  const factory BoardModel({
    @JsonKey(name: 'board_id') @HiveField(0, defaultValue: null) @Default('N/A') String? boardId,
    @JsonKey(name: 'board_name') @HiveField(1, defaultValue: null) @Default('N/A') String? boardName,
    @JsonKey(name: 'board_description') @HiveField(2, defaultValue: null) @Default('N/A') String? boardDescription,
    @JsonKey(name: 'board_hex') @HiveField(3, defaultValue: null) @Default('N/A') String? boardHexColor,
    @JsonKey(name: 'board_shared') @HiveField(4, defaultValue: false) @Default(false) bool isBoardShared,
    @JsonKey(name: 'board_members') @HiveField(5, defaultValue: null) @Default(null) List<UserModel>? boardMembers,
  }) = _BoardModel;

  factory BoardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardModelFromJson(json);
}