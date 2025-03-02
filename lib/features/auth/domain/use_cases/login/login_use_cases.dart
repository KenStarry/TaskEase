import 'package:task_ease/features/auth/domain/use_cases/login/reset_password.dart';
import 'package:task_ease/features/auth/domain/use_cases/login/sign_in_with_email_and_password.dart';

class LoginUseCases {
  final SignInWithEmailAndPassword signInWithEmailAndPassword;
  final ResetPassword resetPassword;

  LoginUseCases({required this.signInWithEmailAndPassword, required this.resetPassword});
}
