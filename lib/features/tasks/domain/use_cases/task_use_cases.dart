import 'package:task_ease/features/tasks/domain/use_cases/add_new_task.dart';
import 'package:task_ease/features/tasks/domain/use_cases/clear_tasks_in_hive.dart';
import 'package:task_ease/features/tasks/domain/use_cases/fetch_tasks_hive.dart';
import 'package:task_ease/features/tasks/domain/use_cases/update_task_in_hive.dart';

import 'delete_task_from_hive.dart';

class TaskUseCases {
  final AddNewTask addNewTask;
  final FetchTasksHive fetchTasksHive;
  final UpdateTaskInHive updateTaskInHive;
  final ClearTasksInHive clearTasksInHive;
  final DeleteTaskFromHive deleteTaskFromHive;

  TaskUseCases(
      {required this.addNewTask,
      required this.fetchTasksHive,
      required this.updateTaskInHive,
        required this.deleteTaskFromHive,
      required this.clearTasksInHive});
}
