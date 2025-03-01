part of 'update_task_bloc.dart';

@immutable
sealed class UpdateTaskState extends Equatable {}

final class UpdateTaskInitial extends UpdateTaskState {
  @override
  List<Object?> get props => [];
}

final class UpdateTaskLoading extends UpdateTaskState {
  @override
  List<Object?> get props => [];
}

final class UpdateTaskSuccess extends UpdateTaskState {

  final TaskModel updatedTask;

  UpdateTaskSuccess({required this.updatedTask});

  @override
  List<Object?> get props => [updatedTask];
}

final class UpdateTaskFailed extends UpdateTaskState {
  final String errorMessage;

  UpdateTaskFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
