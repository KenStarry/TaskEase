import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_ease/core/di/di.dart';
import 'package:task_ease/features/auth/data/repository/auth_repository_impl.dart';

class GetCurrentUser {
  final repo = locator.get<AuthRepositoryImpl>();

  User? call() => repo.getCurrentUser();
}
