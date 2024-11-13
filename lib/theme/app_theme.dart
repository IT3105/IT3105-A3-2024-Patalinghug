import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: const Color(0xFF191970),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF191970),
      secondary: Color(0xFF3b82f6),
      error: Color(0xFFdc3545),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontFamily: 'arial',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white, // Set font color to white
      ),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
      labelMedium: TextStyle(color: Colors.white),
      labelSmall: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white),
      displayMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
      headlineLarge: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white), // Label text color
      hintStyle: TextStyle(color: Colors.white70), // Hint text color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // Border color when enabled
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // Border color when focused
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
    ),
  );

  static const buttonColors = {
    'edit': Color(0xFF28a745),
    'delete': Color(0xFFdc3545),
    'status': Color(0xFF7A4190),
  };
}