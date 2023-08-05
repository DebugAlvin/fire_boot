import 'package:fire_boot/constant/app_themes.dart';
import 'package:flutter/material.dart';

class CustomColorScheme {
  static ColorScheme defaultColorScheme({required bool isDark}) {
    final colorScheme =
        isDark ? const ColorScheme.dark() : const ColorScheme.light();
    return colorScheme.copyWith(
      primary: AppThemes.primaryColor,
    );
  }
}
