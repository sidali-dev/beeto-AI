import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryLight = Color(0xFF63B3ED); // Deep Blue
  static const Color primaryDark = Color(0xFFFFBF00); // yellow

  // Secondary Colors
  static const Color secondaryLight = Color(0xFF4A5568); // Slate Gray
  static const Color secondaryDark = Color(0xFFA0AEC0); // Light Gray

  // Background Colors
  static const Color backgroundLight = Color(0xFFFFFFFF); // White
  static const Color backgroundDark =
      Color.fromARGB(255, 0, 0, 0); // Dark Blue Gray

  // Surface Colors
  static const Color surfaceLight = Color(0xFFF7FAFC); // Light Gray
  static const Color surfaceDark = Color(0xFF2D3748); // Dark Gray

  // Error Colors
  static const Color errorLight = Color(0xFFE53E3E); // Red
  static const Color errorDark = Color(0xFFFC8181); // Light Red

  // Success Colors
  static const Color successLight = Color(0xFF38A169); // Green
  static const Color successDark = Color(0xFF68D391); // Light Green

  // Warning Colors
  static const Color warningLight = Color(0xFFD69E2E); // Yellow
  static const Color warningDark = Color(0xFFF6E05E); // Light Yellow

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF2D3748); // Dark Gray
  static const Color textPrimaryDark = Color(0xFFF7FAFC); // Light Gray

  static const Color textSecondaryLight = Color(0xFF718096); // Medium Gray
  static const Color textSecondaryDark = Color(0xFFA0AEC0); // Light Gray

  // Border Colors
  static const Color borderLight = Color(0xFFE2E8F0); // Light Gray
  static const Color borderDark = Color(0xFF4A5568); // Dark Gray

  // Overlay Colors
  static const Color overlayLight = Color(0x1A000000); // Black with 10% opacity
  static const Color overlayDark = Color(0x1AFFFFFF); // White with 10% opacity

  // Card Colors
  static const Color cardLight = Color(0xFFFFFFFF); // White
  static const Color cardDark = Color(0xFF2D3748); // Dark Gray

  // Input Colors
  static const Color inputLight = Color(0xFFF7FAFC); // Light Gray
  static const Color inputDark = Color(0xFF4A5568); // Dark Gray

  // Icon Colors
  static const Color iconLight = Color(0xFF4A5568); // Slate Gray
  static const Color iconDark = Color(0xFFA0AEC0); // Light Gray

  // Divider Colors
  static const Color dividerLight = Color(0xFFE2E8F0); // Light Gray
  static const Color dividerDark = Color(0xFF4A5568); // Dark Gray

  // Helper method to get theme-aware colors
  static Color getColor(
      BuildContext context, Color lightColor, Color darkColor) {
    return Theme.of(context).brightness == Brightness.light
        ? lightColor
        : darkColor;
  }

  // Common color combinations
  static Color primary(BuildContext context) =>
      getColor(context, primaryLight, primaryDark);

  static Color secondary(BuildContext context) =>
      getColor(context, secondaryLight, secondaryDark);

  static Color background(BuildContext context) =>
      getColor(context, backgroundLight, backgroundDark);

  static Color surface(BuildContext context) =>
      getColor(context, surfaceLight, surfaceDark);

  static Color error(BuildContext context) =>
      getColor(context, errorLight, errorDark);

  static Color success(BuildContext context) =>
      getColor(context, successLight, successDark);

  static Color warning(BuildContext context) =>
      getColor(context, warningLight, warningDark);

  static Color textPrimary(BuildContext context) =>
      getColor(context, textPrimaryLight, textPrimaryDark);

  static Color textSecondary(BuildContext context) =>
      getColor(context, textSecondaryLight, textSecondaryDark);

  static Color border(BuildContext context) =>
      getColor(context, borderLight, borderDark);

  static Color overlay(BuildContext context) =>
      getColor(context, overlayLight, overlayDark);

  static Color card(BuildContext context) =>
      getColor(context, cardLight, cardDark);

  static Color input(BuildContext context) =>
      getColor(context, inputLight, inputDark);

  static Color icon(BuildContext context) =>
      getColor(context, iconLight, iconDark);

  static Color divider(BuildContext context) =>
      getColor(context, dividerLight, dividerDark);
}
