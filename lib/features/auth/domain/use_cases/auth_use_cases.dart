import 'package:task_ease/features/auth/domain/use_cases/login/login_use_cases.dart';
import 'package:task_ease/features/auth/domain/use_cases/signup/signup_use_cases.dart';

class AuthUseCases {
  final LoginUseCases loginUseCases;
  final SignupUseCases signupUseCases;

  AuthUseCases({required this.loginUseCases, required this.signupUseCases});
}
