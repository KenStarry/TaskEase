import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowcasePreferencesUtil {}

class SharedPreferencesUtil {
  SharedPreferencesUtil({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  static const String themeModeKey = "theme_mode";

  ThemeMode getThemeMode() {
    final mode =
        sharedPreferences.getString(themeModeKey) ?? ThemeMode.system.name;

    return ThemeMode.values.byName(mode);
  }

  Future<bool> setThemeMode({required ThemeMode themeMode}) async {
    return await sharedPreferences.setString(themeModeKey, themeMode.name);
  }
}
