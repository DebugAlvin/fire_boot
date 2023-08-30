import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';

class CustomColorScheme {
  static ColorScheme defaultColorScheme({required bool isDark}) {

    final colorScheme =
        isDark ? const ColorScheme.dark() : const ColorScheme.light();
    return colorScheme.copyWith(
      primary: ThemeService.instance.primaryColor,
      secondary: AppThemes.lightGray,
      background: isDark ? AppThemes.widgetColorDark : AppThemes.widgetColorWhite,
      onBackground: isDark ? AppThemes.widgetColorWhite : AppThemes.widgetColorDark,
      surface: isDark ? AppThemes.widgetColorDark : AppThemes.widgetColorWhite,
      onSurface: isDark ? AppThemes.widgetColorWhite : AppThemes.widgetColorDark,
    );
  }
}