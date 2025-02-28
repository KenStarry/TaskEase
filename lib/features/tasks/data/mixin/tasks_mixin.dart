import 'package:hive/hive.dart';
import 'package:task_ease/core/util/constants/hive_constants.dart';

import '../../../../core/model/task_model.dart';

mixin TasksMixin {
  Future<List<TaskModel>> addNewTask({required List<TaskModel> newTask}) async {
    final box = await Hive.openBox(tasksBox);
    //  add task using the UUID
    for (TaskModel task in newTask) {
      await box.put(task.taskId, task);
    }

    final allTasks = box.values.toList().cast<TaskModel>();

    return allTasks;
  }

  Future<List<TaskModel>> fetchTasksHive() async {
    final box = await Hive.openBox(tasksBox);
    final allTasks = box.values.toList().cast<TaskModel>();

    return allTasks;
  }
}
