import 'package:get_it/get_it.dart';
import 'package:task_ease/core/data/repository/core_repository_impl.dart';
import 'package:task_ease/features/auth/data/repository/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_ease/features/auth/domain/use_cases/get_current_user.dart';
import 'package:task_ease/features/auth/domain/use_cases/login/login_use_cases.dart';
import 'package:task_ease/features/auth/domain/use_cases/login/reset_password.dart';
import 'package:task_ease/features/auth/domain/use_cases/login/sign_in_with_email_and_password.dart';
import 'package:task_ease/features/auth/domain/use_cases/signup/create_user_with_email_and_password.dart';
import 'package:task_ease/features/auth/domain/use_cases/signup/signup_use_cases.dart';

import '../../features/auth/domain/use_cases/auth_use_cases.dart';
import '../../features/auth/domain/use_cases/sign_out.dart';

Future<void> invokeAuthDI(GetIt locator) async {
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  locator.registerLazySingleton<AuthRepositoryImpl>(() => AuthRepositoryImpl());

  locator.registerLazySingleton<AuthUseCases>(() => AuthUseCases(
      loginUseCases: LoginUseCases(
          signInWithEmailAndPassword: SignInWithEmailAndPassword(),
          resetPassword: ResetPassword()),
      signupUseCases: SignupUseCases(
          createUserWithEmailAndPassword: CreateUserWithEmailAndPassword()),
      getCurrentUser: GetCurrentUser(),
      signOut: SignOut()));
}
