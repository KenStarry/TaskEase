import 'package:task_ease/core/di/di.dart';
import 'package:task_ease/features/auth/data/repository/auth_repository_impl.dart';

import '../../model/user_model.dart';

class CreateUserWithEmailAndPassword {
  final repo = locator.get<AuthRepositoryImpl>();

  Future<void> call({
    required UserModel userModel,
    required String password,
  }) async =>
      await repo.createUserWithEmailAndPassword(
          userModel: userModel, password: password);
}
