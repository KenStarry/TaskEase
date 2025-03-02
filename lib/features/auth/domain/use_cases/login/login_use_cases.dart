import 'package:task_ease/features/auth/domain/use_cases/login/reset_password.dart';
import 'package:task_ease/features/auth/domain/use_cases/login/sign_in_with_email_and_password.dart';
import 'package:task_ease/features/auth/domain/use_cases/login/sign_in_with_google.dart';

class LoginUseCases {
  final SignInWithEmailAndPassword signInWithEmailAndPassword;
  final SignInWithGoogle signInWithGoogle;
  final ResetPassword resetPassword;

  LoginUseCases(
      {required this.signInWithEmailAndPassword,
      required this.signInWithGoogle,
      required this.resetPassword});
}
