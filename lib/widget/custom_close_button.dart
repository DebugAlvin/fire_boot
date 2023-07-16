import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fire_boot/services/theme_service.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'custom_button.dart';

enum CustomCloseButtonStyle {
  nomal,
  outlined,
}

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    Key? key,
    this.isDark,
    this.miniSize = 13,
    this.onPressed,
    this.alignment = Alignment.centerLeft,
    this.style = CustomCloseButtonStyle.nomal,
    this.maxWidth = 44,
    this.maxHeight = 44,
    this.color = Colors.white,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);
  final bool? isDark;
  final double? miniSize;
  final double? maxWidth;
  final double? maxHeight;
  final VoidCallback? onPressed;
  final AlignmentGeometry? alignment;
  final CustomCloseButtonStyle? style;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // ic_close_outlined
    return CustomButton(
      width: maxWidth,
      height: maxHeight,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          RouteUtil.popView();
        }
      },
      child: Container(
        padding: padding,
        alignment: alignment,
        child: SvgPicture.asset(
          _assetName,
          width: miniSize,
          height: miniSize,
          color: color,
        ),
      ),
    );
  }

  String get _assetName {
    return style == CustomCloseButtonStyle.outlined
        ? 'assets/svg/ic_close_outlined.svg'
        : 'assets/svg/ic_namal_back.svg';
  }
}
