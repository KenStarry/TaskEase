import 'package:task_ease/features/tasks/domain/use_cases/add_new_task.dart';
import 'package:task_ease/features/tasks/domain/use_cases/fetch_tasks_hive.dart';
import 'package:task_ease/features/tasks/domain/use_cases/update_task_in_hive.dart';

class TaskUseCases {
  final AddNewTask addNewTask;
  final FetchTasksHive fetchTasksHive;
  final UpdateTaskInHive updateTaskInHive;

  TaskUseCases(
      {required this.addNewTask,
      required this.fetchTasksHive,
      required this.updateTaskInHive});
}
