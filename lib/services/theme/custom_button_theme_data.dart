import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/extention/button_theme_data_extension.dart';
import 'package:flutter/material.dart';

class CustomButtonThemeData {
  static ButtonThemeData defaultTheme(
      {required ColorScheme colorScheme, required bool isDark}) {
    final defaultTheme = const ButtonThemeData().copyWith(
      height: AppValues.defaultButtonHeight,
      minWidth: AppValues.defaultButtonMiniWidth,
      colorScheme: colorScheme,
    );
    defaultTheme.borderRadius =
    const BorderRadius.all(Radius.circular(AppValues.roundedButtonRadius));
    defaultTheme.horizontalPadding = AppValues.defaultButtonHorizontalPadding;
    defaultTheme.verticalPadding = AppValues.defaultButtonVerticalPadding;
    defaultTheme.borderWith = AppValues.defaultBorderWith;
    defaultTheme.borderColor =
    isDark ? colorScheme.onBackground : colorScheme.onPrimary;
    defaultTheme.disableBorderColor = isDark
        ? colorScheme.onBackground.withOpacity(0.7)
        : colorScheme.onPrimary.withOpacity(0.7);
    defaultTheme.whiteColor = AppThemes.widgetColorWhite;
    defaultTheme.darkColor = AppThemes.widgetColorDark;
    defaultTheme.outLineDisableTextColor = isDark
        ? colorScheme.onBackground.withOpacity(0.7)
        : colorScheme.onPrimary.withOpacity(0.7);
    return defaultTheme;
  }
}
