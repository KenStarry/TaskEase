import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_ease/core/di/di.dart';
import 'package:task_ease/features/auth/domain/model/user_model.dart';

mixin SignUpMixin {
  final auth = locator.get<FirebaseAuth>();
  final firestore = locator.get<FirebaseFirestore>();

  /// Create user with email and password
  Future<void> createUserWithEmailAndPassword({
    required UserModel userModel,
    required String password,
  }) async {
    await auth
        .createUserWithEmailAndPassword(
            email: userModel.userEmail, password: password)
        .then((credentials) async {
      //  Register the user in Firestore
      final User? user = credentials.user;

      if (user != null) {
        final updatedUserModel = userModel.copyWith(userId: user.uid);

        await _createUserInFirestore(uid: user.uid, user: updatedUserModel);
      }
    });
  }

  /// Create User in Firestore
  Future<void> _createUserInFirestore(
          {required String uid, required UserModel user}) async =>
      await firestore.collection('users').doc(uid).set(user.toJson());
}
