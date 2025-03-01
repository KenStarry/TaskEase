part of 'update_task_bloc.dart';

@immutable
sealed class UpdateTaskEvent {}

final class UpdateTaskInHiveEvent extends UpdateTaskEvent {
  final TaskModel updatedTask;

  UpdateTaskInHiveEvent({required this.updatedTask});
}

final class UpdateTaskInFirebaseEvent extends UpdateTaskEvent {
  final TaskModel updatedTask;

  UpdateTaskInFirebaseEvent({required this.updatedTask});
}
