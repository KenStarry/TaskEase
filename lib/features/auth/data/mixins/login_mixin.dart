import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_ease/core/di/di.dart';
import 'package:task_ease/core/util/constants/firebase_constants.dart';
import 'package:task_ease/features/auth/domain/model/user_model.dart';

mixin LoginMixin {
  final auth = locator.get<FirebaseAuth>();
  final firestore = locator.get<FirebaseFirestore>();

  /// Sign In user with email and password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await auth.signInWithEmailAndPassword(email: email, password: password);

  /// Google Sign In
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser == null) return;

    final GoogleSignInAuthentication googleAuth = await gUser!.authentication;

    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await auth.signInWithCredential(credentials).then((credentialedUser) async {
      if (credentialedUser.user != null) {
        await _checkAndCreateUserInFirestore(user: credentialedUser.user!);
      }
    });
  }

  Future<void> _checkAndCreateUserInFirestore({required User user}) async {
    final userDoc = firestore.collection(usersCollection).doc(user.uid);
    final snapshot = await userDoc.get();

    if (!snapshot.exists) {
      final newModel = UserModel(
        userId: userDoc.id,
        userEmail: user.email ?? '',
        userName: user.displayName ?? 'User',
        userAvatar: user.photoURL,
      );
      await userDoc.set(newModel.toJson());
    }
  }

  /// Forgot password
  Future<void> resetPassword({required String email}) async =>
      await auth.sendPasswordResetEmail(email: email);
}
