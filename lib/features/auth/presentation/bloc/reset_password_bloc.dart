import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/di/di.dart';
import '../../domain/use_cases/auth_use_cases.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<ResetPasswordUserEvent>(_resetPasswordEvent);
  }

  Future<void> _resetPasswordEvent(
      ResetPasswordUserEvent event, Emitter<ResetPasswordState> emit) async {
    try {
      emit(ResetPasswordLoading());
      final authUseCases = locator.get<AuthUseCases>();

      await authUseCases.loginUseCases.resetPassword
          .call(email: event.email)
          .then((_) {
        emit(ResetPasswordSuccess());
      });
    } catch (error) {
      emit(ResetPasswordFailed(errorMessage: error.toString()));
    }
  }
}
