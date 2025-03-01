import 'package:get_it/get_it.dart';
import 'package:task_ease/core/data/repository/core_repository_impl.dart';
import 'package:task_ease/features/auth/data/repository/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> invokeAuthDI(GetIt locator) async {
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  locator.registerLazySingleton<AuthRepositoryImpl>(() => AuthRepositoryImpl());
}
