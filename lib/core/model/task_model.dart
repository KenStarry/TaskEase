import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';

part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  @JsonSerializable(explicitToJson: true)
  const factory TaskModel({
    @JsonKey(name: 'task_id') @Default('N/A') String? taskId,
    @JsonKey(name: 'task_parent_id') @Default(null) String? taskParentId,
    @JsonKey(name: 'task_name') @Default('N/A') String? taskName,
    @JsonKey(name: 'task_description') @Default('N/A') String? taskDescription,
    @JsonKey(name: 'task_complete') @Default(false) bool? taskIsComplete,
    @JsonKey(name: 'task_board') @Default(null) String? taskBoard,
    @JsonKey(name: 'task_date') @Default(null) String? taskDate,
    @JsonKey(name: 'task_priority') @Default(null) int? taskPriority,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}