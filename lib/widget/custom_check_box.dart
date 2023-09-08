import 'package:flutter/material.dart';
import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/theme_service.dart';

class CustomCheckBox extends StatelessWidget {
  final ColorScheme? colorScheme;
  final bool value;
  final double? iconSize;
  final double? borderWidth;
  /// 按钮是否可用 默认是true
  final bool? isEnable;
  final double disableOpacity;

  const CustomCheckBox(
      {super.key,
      this.colorScheme,
      this.iconSize = 24,
      required this.value,
      this.borderWidth = 2,
      this.isEnable = true,
      this.disableOpacity = 0.5});

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
              borderRadius: const BorderRadius.all(
                  Radius.circular(AppValues.smallRadius))),
        ),
        Visibility(
          visible: value,
          child: Positioned.fill(
              child: Center(
            child: Image.asset(
              'assets/images/custom_widget/ic_check_box_s.png',
              width: 16,
              height: 12.3,
              color: Colors.white
                  .withOpacity(isEnable == true ? 1.0 : disableOpacity),
            ),
          )),
        ),
      ],
    );
  }
}
