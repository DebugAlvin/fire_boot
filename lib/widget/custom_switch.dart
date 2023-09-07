import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/services/theme/theme_service.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;

  final ValueChanged<bool>? onChanged;

  final Color? activeColor;

  final Color? trackColor;

  final Color? thumbColor;

  final ColorScheme? colorScheme;

  const CustomSwitch(
      {super.key,
      required this.value,
      this.onChanged,
      this.activeColor = AppThemes.greenAccentColor,
      this.trackColor,
      this.thumbColor,
      this.colorScheme});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultColorScheme = colorScheme ?? ThemeService().theme.colorScheme;
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      thumbColor: thumbColor ?? defaultColorScheme.inverseSurface,
      trackColor: trackColor ?? defaultColorScheme.tertiary,
    );
  }
}
