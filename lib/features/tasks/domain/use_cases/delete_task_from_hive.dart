import 'package:task_ease/core/data/repository/core_repository_impl.dart';
import 'package:task_ease/core/di/di.dart';

import '../../../../core/model/task_model.dart';

class DeleteTaskFromHive {
  final repo = locator.get<CoreRepositoryImpl>();

  Future<void> call({required List<String> taskIds}) async =>
      await repo.deleteTaskFromHive(taskIds: taskIds);
}
