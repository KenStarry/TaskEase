import 'package:get_it/get_it.dart';
import 'package:task_ease/core/data/repository/core_repository_impl.dart';
import 'package:task_ease/features/tasks/domain/use_cases/add_new_task.dart';

import '../../features/tasks/domain/use_cases/task_use_cases.dart';

Future<void> invokeTasksDI(GetIt locator) async {
  locator.registerLazySingleton<TaskUseCases>(
      () => TaskUseCases(addNewTask: AddNewTask()));
}
