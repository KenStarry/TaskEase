part of 'tasks_bloc.dart';

@immutable
sealed class TasksState extends Equatable {
  final List<TaskModel> allTasks;

  const TasksState({required this.allTasks});
}

final class TasksInitial extends TasksState {
  const TasksInitial({required super.allTasks});

  @override
  List<Object?> get props => [];
}

final class TasksLoading extends TasksState {
  const TasksLoading({required super.allTasks});

  @override
  List<Object?> get props => [];
}

final class TasksSuccess extends TasksState {
  // final List<TaskModel> allTasks;

  const TasksSuccess({required super.allTasks});

  @override
  List<Object?> get props => [allTasks];
}

final class TasksFailed extends TasksState {
  final String errorMessage;

  const TasksFailed({required this.errorMessage, required super.allTasks});

  @override
  List<Object?> get props => [errorMessage];
}
