import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  static const _key = 'theme_mode';

  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.name);
    state = mode;
  }

  Future<void> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_key);
    if (name != null) {
      state = ThemeMode.values.firstWhere(
        (mode) => mode.name == name,
        orElse: () => ThemeMode.system,
      );
    }
  }

  void toggleThemeMode() {
    final newMode = switch (state) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => ThemeMode.light,
    };
    setThemeMode(newMode);
  }
} 