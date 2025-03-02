import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_ease/core/di/di.dart';

mixin LoginMixin {
  final auth = locator.get<FirebaseAuth>();

  /// Sign In user with email and password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await auth.signInWithEmailAndPassword(email: email, password: password);

  /// Forgot password
  Future<void> resetPassword({required String email}) async =>
      await auth.sendPasswordResetEmail(email: email);
}
