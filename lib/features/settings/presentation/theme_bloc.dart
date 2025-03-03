import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task_ease/core/util/functions/shared_preferences_util.dart';

import '../../../core/di/di.dart';
import '../../../core/model/use_cases/core_use_cases.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ToggleThemeEvent>(_toggleTheme);
  }

  Future<void> _toggleTheme(
      ToggleThemeEvent event, Emitter<ThemeState> emit) async {
    try {
      emit(ThemeLoading());

      await locator
          .get<SharedPreferencesUtil>()
          .setThemeMode(themeMode: event.themeMode);

      switch (event.themeMode) {
        case ThemeMode.light:
          emit(ThemeLightMode());
          break;
        case ThemeMode.system:
          emit(ThemeSystemMode());
          break;
        case ThemeMode.dark:
          emit(ThemeDarkMode());
          break;
      }
    } catch (error) {
      emit(ThemeFailed(errorMessage: error.toString()));
    }
  }
}
