import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_ease/core/data/repository/core_repository_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_ease/core/model/use_cases/core_use_cases.dart';
import 'package:task_ease/core/model/use_cases/user/backup_user_tasks.dart';
import 'package:task_ease/core/model/use_cases/user/fetch_user.dart';
import 'package:task_ease/core/model/use_cases/user/user_use_cases.dart';

import '../util/functions/shared_preferences_util.dart';

Future<void> invokeCoreDI(GetIt locator) async {
  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  /// Shared preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  locator.registerSingleton<SharedPreferencesUtil>(
      SharedPreferencesUtil(sharedPreferences: sharedPreferences));

  locator.registerLazySingleton<CoreRepositoryImpl>(() => CoreRepositoryImpl());

  locator.registerLazySingleton<CoreUseCases>(() => CoreUseCases(
      userUseCases: UserUseCases(
          fetchUser: FetchUser(), backupUserTasks: BackupUserTasks())));
}
