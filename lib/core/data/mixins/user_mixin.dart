import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/util/constants/firebase_constants.dart';
import 'package:task_ease/features/auth/domain/model/user_model.dart';

import '../../di/di.dart';

mixin UserMixin {
  final auth = locator.get<FirebaseAuth>();
  final firestore = locator.get<FirebaseFirestore>();

  /// Fetch User From Firebase
  Future<UserModel?> fetchUser() async {
    final user = auth.currentUser;
    if (user != null) {
      final userDoc = firestore.collection(usersCollection).doc(user.uid);
      final snapshot = await userDoc.get();

      if (snapshot.exists) {
        return UserModel.fromJson(snapshot.data()!);
      }
    }
    return null;
  }

  /// Backup User Tasks to Firebase
  Future<void> backupUserTasksToFirebase(
      {required List<TaskModel> tasks}) async {
    final user = auth.currentUser;
    if (user != null) {
      for (TaskModel task in tasks) {
        final userDoc = firestore
            .collection(usersCollection)
            .doc(user.uid)
            .collection(tasksCollection)
            .doc(task.taskId);

        await userDoc.set(task.toJson());
      }
    }
  }
}
