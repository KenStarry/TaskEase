import 'package:task_ease/features/auth/data/repository/auth_repository_impl.dart';

import '../../../../../core/di/di.dart';

class SignInWithEmailAndPassword {
  final repo = locator.get<AuthRepositoryImpl>();

  Future<void> call({
    required String email,
    required String password,
  }) async =>
      await repo.signInWithEmailAndPassword(email: email, password: password);
}
