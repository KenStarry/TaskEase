// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      taskId: fields[0] as String?,
      taskParentId: fields[1] as String?,
      taskName: fields[2] as String?,
      taskDescription: fields[3] as String?,
      taskIsComplete: fields[4] == null ? false : fields[4] as bool?,
      taskBoard: fields[5] as String?,
      taskDate: fields[6] as String?,
      taskPriority: fields[7] as TaskPriorityModel?,
      taskColor: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.taskId)
      ..writeByte(1)
      ..write(obj.taskParentId)
      ..writeByte(2)
      ..write(obj.taskName)
      ..writeByte(3)
      ..write(obj.taskDescription)
      ..writeByte(4)
      ..write(obj.taskIsComplete)
      ..writeByte(5)
      ..write(obj.taskBoard)
      ..writeByte(6)
      ..write(obj.taskDate)
      ..writeByte(7)
      ..write(obj.taskPriority)
      ..writeByte(8)
      ..write(obj.taskColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      taskId: json['task_id'] as String? ?? null,
      taskParentId: json['task_parent_id'] as String? ?? null,
      taskName: json['task_name'] as String? ?? null,
      taskDescription: json['task_description'] as String? ?? null,
      taskIsComplete: json['task_complete'] as bool? ?? false,
      taskBoard: json['task_board'] as String? ?? null,
      taskDate: json['task_date'] as String? ?? null,
      taskPriority: json['task_priority'] == null
          ? null
          : TaskPriorityModel.fromJson(
              json['task_priority'] as Map<String, dynamic>),
      taskColor: json['task_color'] as String? ?? null,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'task_parent_id': instance.taskParentId,
      'task_name': instance.taskName,
      'task_description': instance.taskDescription,
      'task_complete': instance.taskIsComplete,
      'task_board': instance.taskBoard,
      'task_date': instance.taskDate,
      'task_priority': instance.taskPriority?.toJson(),
      'task_color': instance.taskColor,
    };
