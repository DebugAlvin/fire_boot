import 'package:flutter/material.dart';
import 'package:fire_boot/services/theme/theme_service.dart';

class CustomIcon extends StatelessWidget {
  final String asset;
  final Color? color;
  final double? size;
  final IconThemeData? iconThemeData;

  const CustomIcon(
      {super.key,
      required this.asset,
      this.iconThemeData,
      this.color,
      this.size});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultIconTheme = iconThemeData ?? ThemeService().theme.iconTheme;
    return ImageIcon(
      Image.asset(asset).image,
      color: color ?? defaultIconTheme.color,
      size: size ?? defaultIconTheme.size,
    );
  }
}
