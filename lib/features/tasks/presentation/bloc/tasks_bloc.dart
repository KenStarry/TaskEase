import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:task_ease/core/model/task_model.dart';

import '../../../../core/di/di.dart';
import '../../domain/use_cases/task_use_cases.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial(allTasks: [])) {
    on<FetchAllTasksEvent>(_fetchTasksEvent);
    on<UpdateTasksInBlocEvent>(_updateTasksEvent);
  }

  Future<void> _fetchTasksEvent(
      FetchAllTasksEvent event, Emitter<TasksState> emit) async {
    try {
      emit(TasksLoading(allTasks: state.allTasks));
      final taskUseCases = locator.get<TaskUseCases>();

      await taskUseCases.fetchTasksHive.call().then((allTasks) {
        emit(TasksSuccess(allTasks: allTasks));
      });
    } catch (error) {
      emit(TasksFailed(errorMessage: error.toString(), allTasks: []));
    }
  }

  Future<void> _updateTasksEvent(
      UpdateTasksInBlocEvent event, Emitter<TasksState> emit) async {
    try {
      emit(TasksLoading(allTasks: state.allTasks));
      final currentTasks = state.allTasks;
      final allSubtasksForThisId = currentTasks
          .where((task) =>
              task.taskParentId != null &&
              task.taskParentId == event.updatedTask.taskId)
          .toList();

      currentTasks[currentTasks
              .indexWhere((task) => task.taskId == event.updatedTask.taskId)] =
          event.updatedTask;

      //  Also update all subtasks of this new task with the completed status
      for (TaskModel subTask in allSubtasksForThisId) {
        final subTaskIndex = currentTasks.indexOf(subTask);
        final newSubTask =
            subTask.copyWith(taskIsComplete: event.updatedTask.taskIsComplete);

        currentTasks[subTaskIndex] = newSubTask;
      }

      emit(TasksSuccess(allTasks: currentTasks));
    } catch (error) {
      emit(TasksFailed(errorMessage: error.toString(), allTasks: []));
    }
  }
}
