import 'package:task_ease/features/auth/domain/use_cases/get_current_user.dart';
import 'package:task_ease/features/auth/domain/use_cases/login/login_use_cases.dart';
import 'package:task_ease/features/auth/domain/use_cases/sign_out.dart';
import 'package:task_ease/features/auth/domain/use_cases/signup/signup_use_cases.dart';

class AuthUseCases {
  final LoginUseCases loginUseCases;
  final SignupUseCases signupUseCases;
  final GetCurrentUser getCurrentUser;
  final SignOut signOut;

  AuthUseCases(
      {required this.loginUseCases,
      required this.signupUseCases,
      required this.getCurrentUser,
      required this.signOut});
}
