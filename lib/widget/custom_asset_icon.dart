import 'package:flutter/material.dart';
import 'package:fire_boot/services/theme/theme_service.dart';

class CustomAssetIcon extends StatelessWidget {
  final String name;
  final double? size;
  final IconThemeData? iconThemeData;

  const CustomAssetIcon(
      {super.key, required this.name, this.size, this.iconThemeData});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultIconTheme = iconThemeData ?? ThemeService().theme.iconTheme;
    return Image.asset(name, width: size ?? defaultIconTheme?.size,
      height: size ?? defaultIconTheme?.size,);
  }


}