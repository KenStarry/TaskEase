part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUpUserEvent extends SignUpEvent {
  final UserModel userModel;
  final String password;

  SignUpUserEvent({required this.userModel, required this.password});
}
