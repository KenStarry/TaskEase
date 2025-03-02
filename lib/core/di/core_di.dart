import 'package:get_it/get_it.dart';
import 'package:task_ease/core/data/repository/core_repository_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> invokeCoreDI(GetIt locator) async {
  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  locator.registerLazySingleton<CoreRepositoryImpl>(() => CoreRepositoryImpl());
}
