part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordState extends Equatable {}

final class ResetPasswordInitial extends ResetPasswordState {
  @override
  List<Object?> get props => [];
}

final class ResetPasswordLoading extends ResetPasswordState {
  @override
  List<Object?> get props => [];
}

final class ResetPasswordSuccess extends ResetPasswordState {
  @override
  List<Object?> get props => [];
}

final class ResetPasswordFailed extends ResetPasswordState {
  final String errorMessage;

  ResetPasswordFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
