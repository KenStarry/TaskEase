import 'package:task_ease/core/data/repository/core_repository_impl.dart';
import 'package:task_ease/core/di/di.dart';

import '../../../../core/model/task_model.dart';

class UpdateTaskInHive {
  final repo = locator.get<CoreRepositoryImpl>();

  Future<void> call({required TaskModel updatedTask}) async =>
      repo.updateTaskInHive(updatedTask: updatedTask);
}
