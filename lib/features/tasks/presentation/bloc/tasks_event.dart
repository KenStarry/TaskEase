part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

final class FetchAllTasksEvent extends TasksEvent {}

final class UpdateTasksInBlocEvent extends TasksEvent {
  final TaskModel updatedTask;

  UpdateTasksInBlocEvent({required this.updatedTask});
}

final class DeleteTaskFromBlocEvent extends TasksEvent {
  final String taskId;

  DeleteTaskFromBlocEvent({required this.taskId});
}
