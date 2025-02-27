// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardModelImpl _$$BoardModelImplFromJson(Map<String, dynamic> json) =>
    _$BoardModelImpl(
      boardId: json['board_id'] as String? ?? 'N/A',
      boardName: json['board_name'] as String? ?? 'N/A',
      boardDescription: json['board_description'] as String? ?? 'N/A',
      boardHexColor: json['board_hex'] as String? ?? 'N/A',
      isBoardShared: json['board_shared'] as bool? ?? false,
    );

Map<String, dynamic> _$$BoardModelImplToJson(_$BoardModelImpl instance) =>
    <String, dynamic>{
      'board_id': instance.boardId,
      'board_name': instance.boardName,
      'board_description': instance.boardDescription,
      'board_hex': instance.boardHexColor,
      'board_shared': instance.isBoardShared,
    };
