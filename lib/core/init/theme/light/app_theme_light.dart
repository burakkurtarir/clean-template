import 'package:flutter/material.dart';

import '../../../constants/app/application_constants.dart';
import '../app_theme.dart';
import 'ILightTheme.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight? get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              brightness: Brightness.light,
              color: Colors.blue,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black87, size: 21),
            ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.black12,
          labelStyle: TextStyle(),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          filled: true,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
          focusedBorder: OutlineInputBorder(),
        ),
        scaffoldBackgroundColor: Color(0xfff1f3f8),
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: ColorScheme.light(
                onError: Color(0xffFF2D55),
              ),
            ),
        tabBarTheme: tabBarTheme,
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: insets.lowPaddingAll,
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight!.headline5,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
    );
  }

  TextTheme textTheme() {
    return TextTheme(
      headline1: textThemeLight!.headline1,
      headline2: textThemeLight!.headline2,
      headline3: textThemeLight!.headline3,
      headline4: textThemeLight!.headline4,
      headline5: textThemeLight!.headline5,
      overline: textThemeLight!.overline,
    );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: colorSchemeLight!.black,
      primaryVariant: Colors.white, //xx
      secondary: Colors.green,
      secondaryVariant: colorSchemeLight!.azure,
      surface: Colors.blue, //xx
      background: Color(0xfff6f9fc), //xx
      error: Colors.red[900]!,
      onPrimary: Colors.greenAccent,
      onSecondary: Colors.black, //x
      onSurface: Colors.white30,
      onBackground: Colors.black12,
      onError: Color(0xFFF9B916), //xx
      brightness: Brightness.light,
    );
  }
}
