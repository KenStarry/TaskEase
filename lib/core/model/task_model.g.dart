// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      taskId: json['task_id'] as String? ?? 'N/A',
      taskParentId: json['task_parent_id'] as String? ?? null,
      taskName: json['task_name'] as String? ?? 'N/A',
      taskIsComplete: json['task_complete'] as bool? ?? false,
      taskBoard: json['task_board'] as String? ?? null,
      taskDate: json['task_date'] as String? ?? null,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'task_parent_id': instance.taskParentId,
      'task_name': instance.taskName,
      'task_complete': instance.taskIsComplete,
      'task_board': instance.taskBoard,
      'task_date': instance.taskDate,
    };
