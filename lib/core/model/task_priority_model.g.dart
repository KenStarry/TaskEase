// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_priority_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskPriorityModelAdapter extends TypeAdapter<TaskPriorityModel> {
  @override
  final int typeId = 2;

  @override
  TaskPriorityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskPriorityModel(
      name: fields[0] as String?,
      color: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskPriorityModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskPriorityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskPriorityModelImpl _$$TaskPriorityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TaskPriorityModelImpl(
      name: json['name'] as String? ?? 'N/A',
      color: json['color'] as String? ?? 'N/A',
    );

Map<String, dynamic> _$$TaskPriorityModelImplToJson(
        _$TaskPriorityModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
    };
