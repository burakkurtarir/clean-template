
import 'package:flutter/material.dart';

import '../../constants/enums/app_themes.dart';
import '../theme/dark/app_theme_dark.dart';
import '../theme/light/app_theme_light.dart';
import '../theme/red/app_theme_red.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance!.theme;
  ThemeData get currentTheme => _currentTheme;

  bool get isDark => _currentTheme == AppThemeDark.instance!.theme;

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

  void toggleTheme() {
    if (isDark) {
      _currentTheme = AppThemeLight.instance!.theme;
    } else {
      _currentTheme = AppThemeDark.instance!.theme;
    }
    notifyListeners();
  }
}
