import 'package:task_ease/features/tasks/domain/use_cases/add_new_task.dart';
import 'package:task_ease/features/tasks/domain/use_cases/fetch_tasks_hive.dart';

class TaskUseCases {
  final AddNewTask addNewTask;
  final FetchTasksHive fetchTasksHive;

  TaskUseCases({required this.addNewTask, required this.fetchTasksHive});
}
