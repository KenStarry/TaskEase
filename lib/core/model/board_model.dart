import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_model.freezed.dart';

part 'board_model.g.dart';

@freezed
class BoardModel with _$BoardModel {
  @JsonSerializable(explicitToJson: true)
  const factory BoardModel({
    @JsonKey(name: 'board_id') @Default('N/A') String? boardId,
    @JsonKey(name: 'board_name') @Default('N/A') String? boardName,
    @JsonKey(name: 'board_description') @Default('N/A') String? boardDescription,
    @JsonKey(name: 'board_hex') @Default('N/A') String? boardHexColor,
    @JsonKey(name: 'board_shared') @Default(false) bool? isBoardShared,
  }) = _BoardModel;

  factory BoardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardModelFromJson(json);
}