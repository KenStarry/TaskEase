import '../../../../../core/di/di.dart';
import '../../../data/repository/auth_repository_impl.dart';

class SignInWithGoogle {
  final repo = locator.get<AuthRepositoryImpl>();

  Future<void> call() async => await repo.signInWithGoogle();
}
