import 'package:flutter/material.dart';

class Themes {
  static ThemeData light() {
    const colorScheme = _lightColorScheme;

    return ThemeData(
        brightness: Brightness.light,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
        ));
  }

  static ThemeData dark() {
    const colorScheme = _darkColorScheme;

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
      ),
    );
  }
}

const Color primaryGreen = Color(0xFF19AF78);
const Color mediumGreen = Color(0xFF8CD7B9);
const Color lightGreen = Color(0xFFE1F5F0);

const _lightColorScheme = ColorScheme.light(
  primary: primaryGreen,
  primaryContainer: lightGreen,
  secondary: mediumGreen,
);

const _darkColorScheme = ColorScheme.dark(
  primary: primaryGreen,
  primaryContainer: lightGreen,
  secondary: mediumGreen,
);
