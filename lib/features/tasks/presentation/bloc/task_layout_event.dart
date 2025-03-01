part of 'task_layout_bloc.dart';

@immutable
sealed class TaskLayoutEvent {}

final class ToggleTaskLayoutEvent extends TaskLayoutEvent {
  final Layout layout;

  ToggleTaskLayoutEvent({required this.layout});
}
