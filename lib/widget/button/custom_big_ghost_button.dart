import 'package:fire_boot/services/theme/extention/button_theme_data_extension.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';

class CustomBigGhostButton extends StatelessWidget {
  ///按钮文案，默认'确认'
  final String? title;

  ///文案颜色
  final Color? titleColor;

  ///按钮背景颜色
  final Color? backgroundColor;

  ///点击回调
  final VoidCallback? onTap;

  ///默认父布局可用空间
  final double? width;

  ///默认主题配置
  final ButtonThemeData? themeData;

  const CustomBigGhostButton({
    Key? key,
    this.title,
    this.titleColor,
    this.backgroundColor,
    this.onTap,
    this.width,
    this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonThemeData defaultTheme =
        themeData ?? ThemeService().theme.buttonTheme;
    return CustomButton(
      borderRadius: defaultTheme.borderRadius,
      constraints: BoxConstraints.tightFor(
          width: width ?? double.infinity, height: defaultTheme.height),
      backgroundColor: backgroundColor ??
          defaultTheme.colorScheme?.primary.withOpacity(0.1),
      onTap: onTap,
      alignment: Alignment.center,
      title: title,
      textColor: titleColor ?? defaultTheme.colorScheme?.primary,
    );
  }
}
