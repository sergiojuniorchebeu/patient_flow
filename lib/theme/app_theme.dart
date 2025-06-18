import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF2E7D32),
        primaryContainer: Color(0xFFE8F5E8),
        secondary: Color(0xFF4CAF50),
        secondaryContainer: Color(0xFFC8E6C9),
        surface: Colors.white,
        background: Color(0xFFFAFAFA),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF1B1B1B),
        onBackground: Color(0xFF1B1B1B),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF2E7D32),
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: const Color(0xFF2E7D32).withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF2E7D32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF4CAF50),
        primaryContainer: Color(0xFF1B5E20),
        secondary: Color(0xFF81C784),
        secondaryContainer: Color(0xFF2E7D32),
        surface: Color(0xFF121212),
        background: Color(0xFF000000),
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Colors.white,
        onBackground: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121212),
        foregroundColor: Color(0xFF4CAF50),
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          foregroundColor: Colors.black,
          elevation: 4,
          shadowColor: const Color(0xFF4CAF50).withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF81C784),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
