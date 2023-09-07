import 'package:flutter/material.dart';
import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/theme_service.dart';

class CustomRadioBox extends StatelessWidget {
  final ColorScheme? colorScheme;
  final bool value;
  final double iconSize;
  final double? borderWidth;
  final double centerSize;

  /// 按钮是否可用 默认是true
  final bool? isEnable;
  final double disableOpacity;

  const CustomRadioBox(
      {super.key,
      this.colorScheme,
      this.iconSize = 21,
      required this.value,
      this.borderWidth = 2,
      this.isEnable = true,
      this.disableOpacity = 0.5,
      this.centerSize = 11});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultColorScheme = ThemeService().theme.colorScheme;
    return Stack(
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
              color: value == false
                  ? Colors.transparent
                  : defaultColorScheme.tertiary
                      .withOpacity(isEnable == true ? 1.0 : disableOpacity),
              border: Border.all(
                  color: AppThemes.secondaryIconColor
                      .withOpacity(isEnable == true ? 1.0 : disableOpacity),
                  width: borderWidth ?? 0),
              borderRadius: BorderRadius.all(Radius.circular(iconSize))),
        ),
        Visibility(
          visible: value,
          child: Positioned.fill(
              child: Center(
            child: Container(
              width: centerSize,
              height: centerSize,
              decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(isEnable == true ? 1.0 : disableOpacity),
                  borderRadius: BorderRadius.all(Radius.circular(iconSize))),
            ),
          )),
        ),
      ],
    );
  }
}
