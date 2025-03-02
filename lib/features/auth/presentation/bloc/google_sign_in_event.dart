part of 'google_sign_in_bloc.dart';

@immutable
sealed class GoogleSignInEvent {}

final class GoogleSignInUserEvent extends GoogleSignInEvent {}
