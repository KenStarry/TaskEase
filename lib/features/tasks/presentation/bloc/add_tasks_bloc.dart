import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:task_ease/core/data/repository/core_repository_impl.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/features/tasks/domain/use_cases/task_use_cases.dart';

import '../../../../core/di/di.dart';

part 'add_tasks_event.dart';

part 'add_tasks_state.dart';

class AddTasksBloc extends Bloc<AddTasksEvent, AddTasksState> {
  AddTasksBloc() : super(AddTasksInitial()) {
    on<AddNewTaskEvent>(_addNewTaskEvent);
  }

  Future<void> _addNewTaskEvent(
      AddNewTaskEvent event, Emitter<AddTasksState> emit) async {
    try {
      emit(AddTasksLoading());
      final taskUseCases = locator.get<TaskUseCases>();

      await taskUseCases.addNewTask
          .call(newTask: event.newTask)
          .then((allTasks) {
        emit(AddTasksSuccess(allTasks: allTasks));
      });
    } catch (error) {
      emit(AddTasksFailed(errorMessage: error.toString()));
    }
  }
}
