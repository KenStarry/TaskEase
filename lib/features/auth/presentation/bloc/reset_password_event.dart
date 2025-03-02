part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}

final class ResetPasswordUserEvent extends ResetPasswordEvent {
  final String email;

  ResetPasswordUserEvent({required this.email});
}
