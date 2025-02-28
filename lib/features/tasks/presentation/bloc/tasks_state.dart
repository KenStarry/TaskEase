part of 'tasks_bloc.dart';

@immutable
sealed class TasksState extends Equatable {}

final class TasksInitial extends TasksState {
  @override
  List<Object?> get props => [];
}

final class TasksLoading extends TasksState {
  @override
  List<Object?> get props => [];
}

final class TasksSuccess extends TasksState {

  final List<TaskModel> allTasks;

  TasksSuccess({required this.allTasks});

  @override
  List<Object?> get props => [allTasks];
}

final class TasksFailed extends TasksState {

  final String errorMessage;

  TasksFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
