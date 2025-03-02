import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:task_ease/features/auth/domain/model/user_model.dart';

import '../../../../core/di/di.dart';
import '../../domain/use_cases/auth_use_cases.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpUserEvent>(_signupUserEvent);
  }

  Future<void> _signupUserEvent(
      SignUpUserEvent event, Emitter<SignUpState> emit) async {
    try {
      emit(SignUpLoading());
      final authUseCases = locator.get<AuthUseCases>();

      await authUseCases.signupUseCases.createUserWithEmailAndPassword
          .call(userModel: event.userModel, password: event.password)
          .then((_) {
        emit(SignUpSuccess());
      });
    } catch (error) {
      emit(SignUpFailed(errorMessage: error.toString()));
    }
  }
}
