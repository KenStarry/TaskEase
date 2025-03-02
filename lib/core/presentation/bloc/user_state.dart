part of 'user_bloc.dart';

@immutable
sealed class UserState extends Equatable {}

final class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

final class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

final class UserSuccess extends UserState {
  final UserModel user;

  UserSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

final class UserFailed extends UserState {
  final String errorMessage;

  UserFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
