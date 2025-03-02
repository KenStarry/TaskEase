import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    @JsonKey(name: 'uid') @Default('') String userId,
    @JsonKey(name: 'username') @Default('') String userName,
    @JsonKey(name: 'user_email') @Default('') String userEmail,
    @JsonKey(name: 'user_avatar') @Default('') String? userAvatar,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}