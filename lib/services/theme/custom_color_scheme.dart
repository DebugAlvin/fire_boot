import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:flutter/material.dart';

class CustomColorScheme {
  static ColorScheme defaultColorScheme({required bool isDark}) {
    final colorScheme =
        isDark ? const ColorScheme.dark() : const ColorScheme.light();
    return colorScheme.copyWith(
      primary: AppThemes.primaryColor,
      secondary: AppThemes.textPrimaryColorWhite,
      background: isDark ? AppThemes.widgetColorDark : AppThemes.widgetColorWhite,
      onBackground: isDark ? AppThemes.textPrimaryColorWhite : AppThemes.textPrimaryColorDark,
      onSurface: isDark ? AppThemes.textPrimaryColorWhite : AppThemes.textPrimaryColorDark,
    );
  }
}