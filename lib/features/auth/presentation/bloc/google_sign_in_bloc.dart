import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/di/di.dart';
import '../../domain/use_cases/auth_use_cases.dart';

part 'google_sign_in_event.dart';

part 'google_sign_in_state.dart';

class GoogleSignInBloc extends Bloc<GoogleSignInEvent, GoogleSignInState> {
  GoogleSignInBloc() : super(GoogleSignInInitial()) {
    on<GoogleSignInUserEvent>(_googleSignInEvent);
  }

  Future<void> _googleSignInEvent(
      GoogleSignInUserEvent event, Emitter<GoogleSignInState> emit) async {
    try {
      emit(GoogleSignInLoading());
      final authUseCases = locator.get<AuthUseCases>();

      await authUseCases.loginUseCases.signInWithGoogle.call().then((_) {
        emit(GoogleSignInSuccess());
      });
    } catch (error) {
      emit(GoogleSignInFailed(errorMessage: error.toString()));
    }
  }
}
