part of 'task_layout_bloc.dart';

@immutable
sealed class TaskLayoutState extends Equatable {}

final class TaskLayoutInitial extends TaskLayoutState {
  @override
  List<Object?> get props => [];
}

final class TaskLayoutLoading extends TaskLayoutState {
  @override
  List<Object?> get props => [];
}

final class TaskLayoutCalendarView extends TaskLayoutState {
  @override
  List<Object?> get props => [];
}

final class TaskLayoutTimelineView extends TaskLayoutState {
  @override
  List<Object?> get props => [];
}

final class TaskLayoutCarouselView extends TaskLayoutState {
  @override
  List<Object?> get props => [];
}