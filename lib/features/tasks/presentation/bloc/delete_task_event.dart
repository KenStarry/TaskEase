part of 'delete_task_bloc.dart';

@immutable
sealed class DeleteTaskEvent {}

final class DeleteTaskFromHiveEvent extends DeleteTaskEvent {
  final String taskId;

  DeleteTaskFromHiveEvent({required this.taskId});
}
