import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:task_ease/core/model/use_cases/core_use_cases.dart';

import '../../../features/auth/domain/model/user_model.dart';
import '../../../features/auth/domain/use_cases/auth_use_cases.dart';
import '../../di/di.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserEvent>(_fetchUserEvent);
  }

  Future<void> _fetchUserEvent(
      FetchUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final coreUseCases = locator.get<CoreUseCases>();

      await coreUseCases.userUseCases.fetchUser.call().then((user) {
        emit(UserSuccess(user: user!));
      });
    } catch (error) {
      emit(UserFailed(errorMessage: error.toString()));
    }
  }
}
