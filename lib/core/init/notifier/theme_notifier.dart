import 'dart:math';

import 'package:clean_template/core/constants/enums/app_themes.dart';
import 'package:clean_template/core/init/theme/app_theme.dart';
import 'package:clean_template/core/init/theme/dark/app_theme_dark.dart';
import 'package:clean_template/core/init/theme/light/app_theme_light.dart';
import 'package:clean_template/core/init/theme/red/app_theme_red.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance!.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    switch (theme) {
      case AppThemes.LIGHT:
        _currentTheme = AppThemeLight.instance!.theme;
        break;
      case AppThemes.DARK:
        _currentTheme = AppThemeDark.instance!.theme;
        break;
      case AppThemes.RED:
        _currentTheme = AppThemeRed.instance!.theme;
        break;
      default:
        _currentTheme = AppThemeLight.instance!.theme;
    }
    notifyListeners();
  }

  void changeThemeRandomly() {
    final random = Random().nextInt(2);
  }
}
