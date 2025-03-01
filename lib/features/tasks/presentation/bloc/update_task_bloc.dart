import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:task_ease/core/model/task_model.dart';

import '../../../../core/di/di.dart';
import '../../domain/use_cases/task_use_cases.dart';

part 'update_task_event.dart';

part 'update_task_state.dart';

class UpdateTaskBloc extends Bloc<UpdateTaskEvent, UpdateTaskState> {
  UpdateTaskBloc() : super(UpdateTaskInitial()) {
    on<UpdateTaskInHiveEvent>(_updateTaskInHiveEvent);
  }

  Future<void> _updateTaskInHiveEvent(
      UpdateTaskInHiveEvent event, Emitter<UpdateTaskState> emit) async {
    try {
      emit(UpdateTaskLoading());
      final taskUseCases = locator.get<TaskUseCases>();

      await taskUseCases.updateTaskInHive
          .call(updatedTask: event.updatedTask)
          .then((allTasks) {
        emit(UpdateTaskSuccess());
      });
    } catch (error) {
      emit(UpdateTaskFailed(errorMessage: error.toString()));
    }
  }
}
