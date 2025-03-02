import 'package:task_ease/features/auth/data/repository/auth_repository_impl.dart';

import '../../../../../core/di/di.dart';

class ResetPassword {
  final repo = locator.get<AuthRepositoryImpl>();

  Future<void> call({required String email}) async =>
      await repo.resetPassword(email: email);
}
