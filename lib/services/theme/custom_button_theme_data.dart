import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/extention/button_theme_data_extension.dart';
import 'package:flutter/material.dart';

class CustomButtonThemeData {
  static ButtonThemeData  defaultTheme(ColorScheme colorScheme) {
    final defaultTheme = const ButtonThemeData().copyWith(
      height: AppValues.defaultButtonHeight,
      minWidth: AppValues.defaultButtonMiniWidth,
      colorScheme: colorScheme,
    );
    defaultTheme.borderRadius =
        const BorderRadius.all(Radius.circular(AppValues.smallRadius));
    defaultTheme.disableTextColor = AppThemes.buttonDisableTextColor;
    defaultTheme.disableBackgroundColor =
        AppThemes.buttonDisableBackgroundColor;
    defaultTheme.horizontalPadding = AppValues.defaultButtonHorizontalPadding;
    return defaultTheme;
  }
}
