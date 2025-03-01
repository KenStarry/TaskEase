import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_ease/core/di/di.dart';

mixin SignUpMixin {
  final auth = locator.get<FirebaseAuth>();

  /// Create user with email and password
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
}
