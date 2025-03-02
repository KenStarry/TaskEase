import 'package:task_ease/core/data/repository/core_repository_impl.dart';

import '../../../../features/auth/domain/model/user_model.dart';
import '../../../di/di.dart';

class FetchUser {
  final repo = locator.get<CoreRepositoryImpl>();

  Future<UserModel?> call() async => await repo.fetchUser();
}