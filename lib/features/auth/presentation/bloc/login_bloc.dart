import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:task_ease/features/auth/domain/use_cases/auth_use_cases.dart';

import '../../../../core/di/di.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvent>(_loginUserEvent);
  }

  Future<void> _loginUserEvent(
      LoginUserEvent event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());
      final authUseCases = locator.get<AuthUseCases>();

      await authUseCases.loginUseCases.signInWithEmailAndPassword
          .call(email: event.email, password: event.password)
          .then((_) {
        emit(LoginSuccess());
      });
    } catch (error) {
      emit(LoginFailed(errorMessage: error.toString()));
    }
  }
}
