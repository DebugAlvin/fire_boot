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
        const BorderRadius.all(Radius.circular(AppValues.roundedButtonRadius));
    defaultTheme.disableTextColor = AppThemes.buttonDisableTextColor;
    defaultTheme.horizontalPadding = AppValues.defaultButtonHorizontalPadding;
    defaultTheme.verticalPadding = AppValues.defaultButtonVerticalPadding;
    defaultTheme.borderWith = AppValues.defaultBorderWith;
    defaultTheme.borderColor = AppThemes.buttonBorderColor;
    defaultTheme.disableBorderColor = AppThemes.buttonBorderColor;
    defaultTheme.mainTextColor = AppThemes.buttonMainTextColor;
    defaultTheme.outLineDisableTextColor = AppThemes.buttonOutlineDisableTextColor;
    return defaultTheme;
  }
}
