import 'package:flutter/material.dart';

class AppTextTheme {
  static final TextTheme light = TextTheme(
    displayLarge: const TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
    displayMedium: const TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
    displaySmall: const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
    headlineLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
    headlineMedium: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
    headlineSmall: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
    titleLarge: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A1A),
    ),
    titleMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A1A),
    ),
    titleSmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A1A),
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.grey[800],
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.grey[800],
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: Colors.grey[600],
    ),
  );

  static final TextTheme dark = TextTheme(
    displayLarge: const TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: const TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleSmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.grey[300],
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.grey[300],
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: Colors.grey[400],
    ),
  );
}
