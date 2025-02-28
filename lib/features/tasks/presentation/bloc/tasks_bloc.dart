import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:task_ease/core/model/task_model.dart';

import '../../../../core/di/di.dart';
import '../../domain/use_cases/task_use_cases.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial()) {
    on<FetchAllTasksEvent>(_fetchTasksEvent);
  }

  Future<void> _fetchTasksEvent(
      FetchAllTasksEvent event, Emitter<TasksState> emit) async {
    try {
      emit(TasksLoading());
      final taskUseCases = locator.get<TaskUseCases>();

      await taskUseCases.fetchTasksHive.call().then((allTasks) {
        emit(TasksSuccess(allTasks: allTasks));
      });
    } catch (error) {
      emit(TasksFailed(errorMessage: error.toString()));
    }
  }
}
