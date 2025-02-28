part of 'add_tasks_bloc.dart';

@immutable
sealed class AddTasksState extends Equatable {}

final class AddTasksInitial extends AddTasksState {
  @override
  List<Object?> get props => [];
}

final class AddTasksLoading extends AddTasksState {
  @override
  List<Object?> get props => [];
}

final class AddTasksSuccess extends AddTasksState {

  final List<TaskModel> allTasks;

  AddTasksSuccess({required this.allTasks});

  @override
  List<Object?> get props => [allTasks];
}

final class AddTasksFailed extends AddTasksState {
  final String errorMessage;

  AddTasksFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
