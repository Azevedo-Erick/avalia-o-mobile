import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppTheme {
  static const ColorScheme _colorSchemeLight = ColorScheme(
      primary: Color(0xFF00A8E8),
      secondary: Color(0xFFFFCB05),
      background: Colors.white,
      surface: Color.fromARGB(255, 214, 214, 214),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: Colors.black,
      onSurface: Colors.black,
      brightness: Brightness.light,
      error: Colors.red,
      onError: Colors.red);

  static const ColorScheme _colorSchemeDark = ColorScheme(
      primary: Color(0xFF0086C3),
      secondary: Color(0xFFFFC107),
      background: Color(0xFF1C1C1E),
      surface: Color(0xFF2C2C2E),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: Colors.white,
      onSurface: Colors.white,
      brightness: Brightness.dark,
      error: Colors.red,
      onError: Colors.red);
  static const TextTheme _textThemeLight = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
    ),
  );
  static const TextTheme _textThemeDark = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: _colorSchemeLight,
    textTheme: _textThemeLight,
    fontFamily: GoogleFonts.k2d().fontFamily,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      toolbarTextStyle: TextTheme(
        titleLarge: GoogleFonts.k2d(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: GoogleFonts.k2d(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ).titleLarge,
    ),
    scaffoldBackgroundColor: _colorSchemeLight.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _colorSchemeLight.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        textStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: _colorSchemeLight.primary,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      fillColor: Colors.grey[100],
      filled: true,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: _colorSchemeDark,
    textTheme: _textThemeDark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle: TextTheme(
        titleLarge: GoogleFonts.montserrat(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: GoogleFonts.montserrat(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ).titleLarge,
    ),
    scaffoldBackgroundColor: _colorSchemeDark.background,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _colorSchemeDark.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        textStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[800]!,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: _colorSchemeDark.primary,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      fillColor: Colors.grey[900],
      filled: true,
    ),
  );
}
