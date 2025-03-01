part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

final class FetchAllTasksEvent extends TasksEvent {}

final class UpdateTasksInBlocEvent extends TasksEvent {
  final TaskModel updatedTask;

  UpdateTasksInBlocEvent({required this.updatedTask});
}
