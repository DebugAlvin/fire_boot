import 'package:flutter/material.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/theme_service.dart';

/// 自定义Text builder
typedef TextBuilder = Widget Function(BuildContext context);

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget(
      {Key? key,
        this.width,
        this.height,
        this.alignment = Alignment.center,
        this.backgroundColor,
        this.text = "暂无数据",
        this.imgPath = "assets/images/data_empty.png",
        this.colorScheme,
        this.textBuilder})
      : super(key: key);
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final String? text;
  final String? imgPath;
  final ColorScheme? colorScheme;
  final TextBuilder? textBuilder;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultColorScheme = ThemeService().theme.colorScheme;
    return Center(
      child: Container(
          width: width,
          height: height,
          alignment: alignment,
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imgPath!,
                fit: BoxFit.contain,
                scale: 2,
              ),
              const SizedBox(
                height: AppValues.defaultPadding,
              ),
              textBuilder != null
                  ? Builder(
                builder: (context) {
                  return textBuilder!(context);
                },
              )
                  : Text(
                text!,
                style: ThemeService()
                    .theme
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: defaultColorScheme.onSurface),
              ),
            ],
          )),
    );
  }
}
