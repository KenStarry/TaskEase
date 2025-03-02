part of 'delete_task_bloc.dart';

@immutable
sealed class DeleteTaskState extends Equatable {}

final class DeleteTaskInitial extends DeleteTaskState {
  @override
  List<Object?> get props => [];
}

final class DeleteTaskLoading extends DeleteTaskState {
  @override
  List<Object?> get props => [];
}

final class DeleteTaskSuccess extends DeleteTaskState {
  @override
  List<Object?> get props => [];
}

final class DeleteTaskFailed extends DeleteTaskState {
  final String errorMessage;

  DeleteTaskFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
