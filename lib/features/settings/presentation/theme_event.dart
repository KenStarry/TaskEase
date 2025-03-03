part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

final class ToggleThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;

  ToggleThemeEvent({required this.themeMode});
}
