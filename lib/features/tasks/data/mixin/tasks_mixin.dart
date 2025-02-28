import 'package:hive/hive.dart';
import 'package:task_ease/core/util/constants/hive_constants.dart';

import '../../../../core/model/task_model.dart';

mixin TasksMixin {
  final box = Hive.box(tasksBox);

  Future<List<TaskModel>> addNewTask({required List<TaskModel> newTask}) async {
    //  add task using the UUID
    for (TaskModel task in newTask) {
      await box.put(task.taskId, task);
    }

    final allTasks = box.values.toList().cast<TaskModel>();

    return allTasks;
  }
}
