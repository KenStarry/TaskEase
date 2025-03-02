part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {}

final class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginSuccess extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginFailed extends LoginState {
  final String errorMessage;

  LoginFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
