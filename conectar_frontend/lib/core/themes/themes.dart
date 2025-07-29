import 'package:flutter/material.dart';

class Themes {
  static _baseThemeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
      ),
      cardTheme: CardThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(globalBorderRadius)),
        ),
        color: colorScheme.onPrimary,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: Border.all(
          color: Colors.transparent,
        ),
        childrenPadding: const EdgeInsets.all(16),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: colorScheme.onPrimary,
        unselectedLabelColor: colorScheme.onPrimary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.outline),
          borderRadius: const BorderRadius.all(
            Radius.circular(globalBorderRadius),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.outline),
          borderRadius: const BorderRadius.all(
            Radius.circular(globalBorderRadius),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.outline),
          borderRadius: const BorderRadius.all(
            Radius.circular(globalBorderRadius),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(globalBorderRadius),
          ),
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
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.maximumDensity,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(colorScheme.primary),
          side: WidgetStatePropertyAll(BorderSide(color: colorScheme.primary)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(globalBorderRadius),
              side: BorderSide(color: colorScheme.primary),
            ),
          ),
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.maximumDensity,
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
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.maximumDensity,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(globalBorderRadius),
            ),
          ),
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.maximumDensity,
          ),
        ),
      ),
      dataTableTheme: DataTableThemeData(
        headingRowColor: WidgetStatePropertyAll(
          colorScheme.primaryContainer,
        ),
        headingTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        subtitleTextStyle: TextStyle(
          color: colorScheme.outline,
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
const Color background = Color.fromARGB(255, 245, 245, 245);

final _lightColorScheme = ColorScheme.light(
  primary: primaryGreen,
  onPrimary: Colors.white,
  primaryContainer: lightGreen,
  secondary: mediumGreen,
  outline: Colors.grey.shade400,
  outlineVariant: Colors.grey.shade200,
  surface: background,
  onSurface: Colors.black,
  surfaceBright: Colors.white,
);

final _darkColorScheme = ColorScheme.dark(
  primary: primaryGreen,
  onPrimary: Colors.white,
  primaryContainer: lightGreen,
  secondary: mediumGreen,
  outlineVariant: Colors.grey.shade200,
);

const globalBorderRadius = 8.0;
