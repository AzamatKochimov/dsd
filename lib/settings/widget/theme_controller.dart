import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/styles/themes.dart';

const String _spThemeKey = 'is_light_theme';

// ignore: prefer_mixin
class ThemeController with ChangeNotifier {
  ThemeController() : _isLight = ui.window.platformBrightness != ui.Brightness.dark {
    SharedPreferences.getInstance().then<void>(
      (sp) {
        final theme = sp.getBool(_spThemeKey);
        if (theme != null && theme != isLight) {
          _isLight = theme;
          notifyListeners();
        }
      },
      onError: l.w,
    );
  }

  ThemeData get theme => isLight ? AppThemes.light() : AppThemes.dark();

  bool get isLight => _isLight;

  bool get isDark => !isLight;

  bool _isLight;

  void switchTheme() {
    _isLight = !_isLight;
    SharedPreferences.getInstance().then<void>(
      (sp) {
        sp.setBool(_spThemeKey, _isLight);
      },
      onError: l.w,
    );
    notifyListeners();
  }
}
