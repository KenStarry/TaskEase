import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:task_ease/features/auth/domain/model/user_model.dart';

part 'task_priority_model.freezed.dart';

part 'task_priority_model.g.dart';

@freezed
@HiveType(typeId: 2)
class TaskPriorityModel with _$TaskPriorityModel {
  @JsonSerializable(explicitToJson: true)
  const factory TaskPriorityModel({
    @JsonKey(name: 'name') @HiveField(0, defaultValue: null) @Default('N/A') String? name,
    @JsonKey(name: 'color') @HiveField(1, defaultValue: null) @Default('N/A') String? color,
  }) = _TaskPriorityModel;

  factory TaskPriorityModel.fromJson(Map<String, dynamic> json) =>
      _$TaskPriorityModelFromJson(json);
}