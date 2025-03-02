import '../../../../core/di/di.dart';
import '../../data/repository/auth_repository_impl.dart';

class SignOut {
  final repo = locator.get<AuthRepositoryImpl>();

  Future<void> call() async => await repo.signOut();
}
