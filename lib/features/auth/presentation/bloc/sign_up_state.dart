part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState extends Equatable {}

final class SignUpInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}

final class SignUpLoading extends SignUpState {
  @override
  List<Object?> get props => [];
}

final class SignUpSuccess extends SignUpState {
  @override
  List<Object?> get props => [];
}

final class SignUpFailed extends SignUpState {
  final String errorMessage;

  SignUpFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}