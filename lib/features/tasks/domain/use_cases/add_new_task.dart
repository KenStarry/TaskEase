import 'package:task_ease/core/data/repository/core_repository_impl.dart';
import 'package:task_ease/core/di/di.dart';

import '../../../../core/model/task_model.dart';

class AddNewTask {
  final repo = locator.get<CoreRepositoryImpl>();

  Future<List<TaskModel>> call({required List<TaskModel> newTask}) async =>
      await repo.addNewTask(newTask: newTask);
}
