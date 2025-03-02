part of 'google_sign_in_bloc.dart';

@immutable
sealed class GoogleSignInState extends Equatable {}

final class GoogleSignInInitial extends GoogleSignInState {
  @override
  List<Object?> get props => [];
}

final class GoogleSignInLoading extends GoogleSignInState {
  @override
  List<Object?> get props => [];
}

final class GoogleSignInSuccess extends GoogleSignInState {
  @override
  List<Object?> get props => [];
}

final class GoogleSignInFailed extends GoogleSignInState {
  final String errorMessage;

  GoogleSignInFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
