import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<void> _loginUserEvent(LoginUserEvent event, Emitter<LoginState> emit) async {
    try {

      final authUseCases;
      
    } catch (error) {
      emit(LoginFailed(errorMessage: error.toString()));
    }
  }
}
