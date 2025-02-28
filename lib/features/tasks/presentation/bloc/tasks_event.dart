part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

final class FetchAllTasksEvent extends TasksEvent {}
