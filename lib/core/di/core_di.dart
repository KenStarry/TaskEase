import 'package:get_it/get_it.dart';
import 'package:task_ease/core/data/repository/core_repository_impl.dart';

Future<void> invokeCoreDI(GetIt locator) async {
  locator.registerLazySingleton<CoreRepositoryImpl>(() => CoreRepositoryImpl());
}