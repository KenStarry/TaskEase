import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_ease/features/auth/data/repository/auth_repository_impl.dart';

import '../../../core/di/di.dart';

class AuthNotifier extends ChangeNotifier {
  late final StreamSubscription<User?> _authSubscription;
  User? _user;

  AuthNotifier() {
    _authSubscription =
        locator.get<AuthRepositoryImpl>().authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get user => _user;

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }
}
