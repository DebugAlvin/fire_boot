import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'custom_button.dart';

enum CustomAppBarIconStyle {
  back,
  close,
}

class CustomAppBarIconButton extends StatelessWidget {
  const CustomAppBarIconButton({
    Key? key,
    this.isDark,
    this.miniSize = 18,
    this.onPressed,
    this.alignment = Alignment.center,
    this.style = CustomAppBarIconStyle.back,
    this.maxWidth = 44,
    this.maxHeight = 44,
    this.color = Colors.black,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);
  final bool? isDark;
  final double? miniSize;
  final double? maxWidth;
  final double? maxHeight;
  final VoidCallback? onPressed;
  final AlignmentGeometry? alignment;
  final CustomAppBarIconStyle? style;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
    return style == CustomAppBarIconStyle.close
        ? 'assets/svg/ic_close_outlined.svg'
        : 'assets/svg/ic_normal_back.svg';
  }
}
