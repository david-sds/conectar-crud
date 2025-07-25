import 'package:flutter/material.dart';

class Themes {
  static _baseThemeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: colorScheme.onPrimary,
        unselectedLabelColor: colorScheme.onPrimary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(globalBorderRadius)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(globalBorderRadius)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(globalBorderRadius)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(globalBorderRadius)),
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(globalBorderRadius),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(globalBorderRadius),
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(globalBorderRadius),
            ),
          ),
        ),
      ),
    );
  }

  static ThemeData light() {
    return _baseThemeData(_lightColorScheme);
  }

  static ThemeData dark() {
    return _baseThemeData(_darkColorScheme);
  }
}

const Color primaryGreen = Color(0xFF19AF78);
const Color mediumGreen = Color(0xFF8CD7B9);
const Color lightGreen = Color(0xFFE1F5F0);

final _lightColorScheme = ColorScheme.light(
  primary: primaryGreen,
  onPrimary: Colors.white,
  primaryContainer: lightGreen,
  secondary: mediumGreen,
  outlineVariant: Colors.grey.shade200,
);

final _darkColorScheme = ColorScheme.dark(
  primary: primaryGreen,
  onPrimary: Colors.white,
  primaryContainer: lightGreen,
  secondary: mediumGreen,
  outlineVariant: Colors.grey.shade200,
);

const globalBorderRadius = 8.0;
