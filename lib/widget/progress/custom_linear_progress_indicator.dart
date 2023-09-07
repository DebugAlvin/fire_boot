import 'package:flutter/material.dart';
import 'package:fire_boot/services/theme/theme_service.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  final double? value;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final double? minHeight;
  ///优先级other color(color、backgroundColor) > colorScheme
  final ColorScheme? colorScheme;
  const CustomLinearProgressIndicator(
      {super.key,
      this.value,
      this.backgroundColor,
      this.color,
      this.valueColor,
      this.minHeight = 2,
      this.colorScheme});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final defaultColorScheme = colorScheme ?? ThemeService().theme.colorScheme;
    return LinearProgressIndicator(
      value: value,
      backgroundColor: backgroundColor ?? defaultColorScheme.tertiary,
      color: color,
      valueColor:
          valueColor ?? AlwaysStoppedAnimation(defaultColorScheme.primary),
      minHeight: minHeight,
    );
  }
}
