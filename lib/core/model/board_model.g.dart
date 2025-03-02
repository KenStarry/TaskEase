// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BoardModelAdapter extends TypeAdapter<BoardModel> {
  @override
  final int typeId = 1;

  @override
  BoardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BoardModel(
      boardId: fields[0] as String?,
      boardName: fields[1] as String?,
      boardDescription: fields[2] as String?,
      boardHexColor: fields[3] as String?,
      isBoardShared: fields[4] == null ? false : fields[4] as bool,
      boardMembers: (fields[5] as List?)?.cast<UserModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, BoardModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.boardId)
      ..writeByte(1)
      ..write(obj.boardName)
      ..writeByte(2)
      ..write(obj.boardDescription)
      ..writeByte(3)
      ..write(obj.boardHexColor)
      ..writeByte(4)
      ..write(obj.isBoardShared)
      ..writeByte(5)
      ..write(obj.boardMembers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      boardMembers: (json['board_members'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );

Map<String, dynamic> _$$BoardModelImplToJson(_$BoardModelImpl instance) =>
    <String, dynamic>{
      'board_id': instance.boardId,
      'board_name': instance.boardName,
      'board_description': instance.boardDescription,
      'board_hex': instance.boardHexColor,
      'board_shared': instance.isBoardShared,
      'board_members': instance.boardMembers?.map((e) => e.toJson()).toList(),
    };
