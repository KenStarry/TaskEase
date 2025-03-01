import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:task_ease/core/model/enum/layouts_enum.dart';

part 'task_layout_event.dart';

part 'task_layout_state.dart';

class TaskLayoutBloc extends Bloc<TaskLayoutEvent, TaskLayoutState> {
  TaskLayoutBloc() : super(TaskLayoutInitial()) {
    on<ToggleTaskLayoutEvent>(_toggleLayoutEvent);
  }

  Future<void> _toggleLayoutEvent(
      ToggleTaskLayoutEvent event, Emitter<TaskLayoutState> emit) async {
    emit(TaskLayoutLoading());

    if (event.layout == Layout.calendar) {
      emit(TaskLayoutCalendarView());
    } else if (event.layout == Layout.timeline) {
      emit(TaskLayoutTimelineView());
    } else if (event.layout == Layout.carousel) {
      emit(TaskLayoutCarouselView());
    } else {
      emit(TaskLayoutTimelineView());
    }
  }
}
