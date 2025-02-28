part of 'add_tasks_bloc.dart';

@immutable
sealed class AddTasksEvent {}

final class AddNewTaskEvent extends AddTasksEvent {
  final List<TaskModel> newTask;

  AddNewTaskEvent({required this.newTask});
}
