import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_ease/features/auth/data/mixins/login_mixin.dart';

import '../../../../core/di/di.dart';
import '../mixins/sign_up_mixin.dart';

class AuthRepositoryImpl with LoginMixin, SignUpMixin {
  final googleSignIn = locator.get<GoogleSignIn>();

  /// Get Current User
  User? getCurrentUser() => auth.currentUser;

  /// Listen to User State Changes
  Stream<User?> authStateChanges() => auth.authStateChanges();

  /// Sign Out
  Future<void> signOut() async {
    await Future.wait([googleSignIn.disconnect(), auth.signOut()]);
  }
}
