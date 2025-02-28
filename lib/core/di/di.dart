import 'package:get_it/get_it.dart';
import 'package:task_ease/core/di/core_di.dart';
import 'package:task_ease/core/di/tasks_di.dart';

final locator = GetIt.instance;

Future<void> setupDependencies() async {
  invokeCoreDI(locator);
  invokeTasksDI(locator);
}
