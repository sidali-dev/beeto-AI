import 'package:flutter/material.dart';

class AppCardTheme {
  static final CardTheme light = CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    color: Colors.white,
  );

  static final CardTheme dark = CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    color: Colors.grey[800],
  );
}
