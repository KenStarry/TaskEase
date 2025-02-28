import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'task_model.freezed.dart';

part 'task_model.g.dart';

@freezed
@HiveType(typeId: 0)
class TaskModel with _$TaskModel {
  @JsonSerializable(explicitToJson: true)
  const factory TaskModel({
    @JsonKey(name: 'task_id') @HiveField(0, defaultValue: null) @Default(null) String? taskId,
    @JsonKey(name: 'task_parent_id') @HiveField(1, defaultValue: null) @Default(null) String? taskParentId,
    @JsonKey(name: 'task_name') @HiveField(2, defaultValue: null) @Default(null) String? taskName,
    @JsonKey(name: 'task_description') @HiveField(3, defaultValue: null) @Default(null) String? taskDescription,
    @JsonKey(name: 'task_complete') @HiveField(4, defaultValue: false) @Default(false) bool? taskIsComplete,
    @JsonKey(name: 'task_board') @HiveField(5, defaultValue: null) @Default(null) String? taskBoard,
    @JsonKey(name: 'task_date') @HiveField(6, defaultValue: null) @Default(null) String? taskDate,
    @JsonKey(name: 'task_priority') @HiveField(7, defaultValue: null) @Default(null) int? taskPriority,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}