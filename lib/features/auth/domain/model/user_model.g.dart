// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: json['uid'] as String? ?? '',
      userName: json['username'] as String? ?? '',
      userEmail: json['user_email'] as String? ?? '',
      userAvatar: json['user_avatar'] as String? ?? '',
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.userId,
      'username': instance.userName,
      'user_email': instance.userEmail,
      'user_avatar': instance.userAvatar,
    };
