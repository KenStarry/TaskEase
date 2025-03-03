part of 'theme_bloc.dart';

@immutable
sealed class ThemeState extends Equatable {}

final class ThemeInitial extends ThemeState {
  @override
  List<Object?> get props => [];
}

final class ThemeLoading extends ThemeState {
  @override
  List<Object?> get props => [];
}

final class ThemeDarkMode extends ThemeState {
  @override
  List<Object?> get props => [];
}

final class ThemeLightMode extends ThemeState {
  @override
  List<Object?> get props => [];
}

final class ThemeSystemMode extends ThemeState {
  @override
  List<Object?> get props => [];
}

final class ThemeFailed extends ThemeState {

  final String errorMessage;

  ThemeFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
