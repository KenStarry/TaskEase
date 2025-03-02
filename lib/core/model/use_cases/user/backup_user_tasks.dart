import '../../../data/repository/core_repository_impl.dart';
import '../../../di/di.dart';
import '../../task_model.dart';

class BackupUserTasks {
  final repo = locator.get<CoreRepositoryImpl>();

  Future<void> call({required List<TaskModel> tasks}) async =>
      await repo.backupUserTasksToFirebase(tasks: tasks);
}