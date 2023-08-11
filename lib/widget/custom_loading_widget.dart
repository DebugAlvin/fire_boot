import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fire_boot/services/theme/theme_service.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget(
      {Key? key,
      this.width,
      this.height,
      this.alignment = Alignment.center,
      this.color,
      this.isDark})
      : super(key: key);

  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Color? color;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final isDarkMode = isDark ?? ThemeService().isDarkMode;
    final defaultTheme = ThemeService().theme;
    return Center(
      child: Container(
          width: width,
          height: height,
          alignment: alignment,
          decoration: BoxDecoration(
            color: color,
          ),
          child: SpinKitFadingCube(
            size: 20,
            color: isDarkMode
                ? defaultTheme.colorScheme.onSurface
                : defaultTheme.colorScheme.primary,
            duration: const Duration(milliseconds: 1200),
          )),
    );
  }
}
