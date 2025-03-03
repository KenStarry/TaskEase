import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:task_ease/core/model/task_model.dart';

import '../../di/di.dart';
import '../../model/use_cases/core_use_cases.dart';

part 'backup_event.dart';
part 'backup_state.dart';

class BackupBloc extends Bloc<BackupEvent, BackupState> {
  BackupBloc() : super(BackupInitial()) {
    on<BackupToFirebaseEvent>(_fetchUserEvent);
  }

  Future<void> _fetchUserEvent(
      BackupToFirebaseEvent event, Emitter<BackupState> emit) async {
    try {
      emit(BackupLoading());
      final coreUseCases = locator.get<CoreUseCases>();

      await coreUseCases.userUseCases.backupUserTasks.call(tasks: event.allTasks).then((_) {
        emit(BackupSuccess());
      });
    } catch (error) {
      emit(BackupFailed(errorMessage: error.toString()));
    }
  }
}
