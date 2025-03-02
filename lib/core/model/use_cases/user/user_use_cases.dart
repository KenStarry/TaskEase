import 'package:task_ease/core/model/use_cases/user/backup_user_tasks.dart';

import 'fetch_user.dart';

class UserUseCases {

  final FetchUser fetchUser;
  final BackupUserTasks backupUserTasks;

  UserUseCases({required this.fetchUser, required this.backupUserTasks});
}