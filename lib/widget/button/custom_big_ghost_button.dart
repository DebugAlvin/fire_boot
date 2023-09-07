import 'package:fire_boot/services/theme/extention/button_theme_data_extension.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';

class CustomBigGhostButton extends StatelessWidget {
  ///按钮文案，默认'确认'
  final String? title;

  ///点击回调
  final VoidCallback? onTap;

  ///默认父布局可用空间
  final double? width;

  ///主题颜色
  final Color? color;

  ///默认按钮主题
  final ButtonThemeData? themeData;

  ///调色板
  final ColorScheme? colorScheme;

  const CustomBigGhostButton({
    Key? key,
    this.title,
    this.onTap,
    this.width,
    this.themeData,
    this.color,
    this.colorScheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonThemeData defaultTheme =
        themeData ?? ThemeService().theme.buttonTheme;
    final defaultColorScheme = colorScheme ?? ThemeService().theme.colorScheme;
    return CustomButton.outline(
      constraints:  BoxConstraints(
        minWidth: double.infinity,
        maxWidth: double.infinity,
        minHeight: defaultTheme.height,
      ),
      borderWith: defaultTheme.borderWith,
      borderRadius: defaultTheme.borderRadius,
      title: title,
      disableLineColor: defaultTheme.disableBorderColor,
      lineColor: _getColor(defaultColorScheme),
      textColor:_getColor(defaultColorScheme),
      alignment: Alignment.center,
      onTap: onTap,
      disableTextColor: defaultTheme.outLineDisableTextColor,
    );
  }

  Color _getColor(ColorScheme colorScheme) {
    return color ?? colorScheme.primary;
  }

}
