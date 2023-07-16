import 'package:flutter/material.dart';
import 'package:fire_boot/constant/app_themes.dart';

enum NetWorkImagePlaceholderType {
  loading(1, 'loading'),
  error(2, 'error');

  const NetWorkImagePlaceholderType(this.number, this.value);

  final int number;

  final String value;
}

class CustomNetWorkImagePlaceholder extends StatelessWidget {
  final NetWorkImagePlaceholderType placeholderType;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;

  const CustomNetWorkImagePlaceholder({
    Key? key,
    required this.placeholderType,
    this.borderRadius,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: AppThemes.dividerColor,
        borderRadius: borderRadius,
        border: border,
      ),
    );
  }
}
