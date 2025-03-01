import 'package:get_it/get_it.dart';
import 'package:task_ease/core/data/repository/core_repository_impl.dart';
import 'package:task_ease/features/tasks/domain/use_cases/add_new_task.dart';
import 'package:task_ease/features/tasks/domain/use_cases/clear_tasks_in_hive.dart';
import 'package:task_ease/features/tasks/domain/use_cases/fetch_tasks_hive.dart';
import 'package:task_ease/features/tasks/domain/use_cases/update_task_in_hive.dart';

import '../../features/tasks/domain/use_cases/delete_task_from_hive.dart';
import '../../features/tasks/domain/use_cases/task_use_cases.dart';

Future<void> invokeTasksDI(GetIt locator) async {
  locator.registerLazySingleton<TaskUseCases>(() => TaskUseCases(
      addNewTask: AddNewTask(),
      fetchTasksHive: FetchTasksHive(),
      updateTaskInHive: UpdateTaskInHive(),
      clearTasksInHive: ClearTasksInHive(),
      deleteTaskFromHive: DeleteTaskFromHive()));
}
