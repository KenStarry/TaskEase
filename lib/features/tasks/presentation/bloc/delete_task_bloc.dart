import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/di/di.dart';
import '../../domain/use_cases/task_use_cases.dart';

part 'delete_task_event.dart';

part 'delete_task_state.dart';

class DeleteTaskBloc extends Bloc<DeleteTaskEvent, DeleteTaskState> {
  DeleteTaskBloc() : super(DeleteTaskInitial()) {
    on<DeleteTaskFromHiveEvent>(_deleteTaskEvent);
  }

  Future<void> _deleteTaskEvent(
      DeleteTaskFromHiveEvent event, Emitter<DeleteTaskState> emit) async {
    try {
      emit(DeleteTaskLoading());
      final taskUseCases = locator.get<TaskUseCases>();

      await taskUseCases.deleteTaskFromHive
          .call(taskIds: [event.taskId])
          .then((_) {
        emit(DeleteTaskSuccess());
      });
    } catch (error) {
      emit(DeleteTaskFailed(errorMessage: error.toString()));
    }
  }
}
