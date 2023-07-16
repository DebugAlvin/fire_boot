import 'package:flutter/material.dart';
import 'package:fire_boot/constant/app_themes.dart';
import '../../constant/app_button_style.dart';
import '../../services/theme_service.dart';

/// @class : CustomButton
/// @date : 2023/01/10
/// @name : alvin
/// @description :对TextButton常用样式的封装
/// 主要参数：useAccentColor，是否使用主题色，默认是false说明它是一个背景色为透明颜色，
/// 我们设置true并且设置了title的情况它就是我们经常使用的提交按钮
/// 如果需要设置其它样式可以使用borderRadius，border等参数，或者自定义child

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.title = '',
    this.width,
    this.height,
    this.borderRadius,
    this.useAccentColor = false,
    this.onPressed,
    this.child,
    this.border,
    this.alignment,
    this.margin,
    this.color, this.titleTextStyle,
  }) : super(key: key);
  final String? title;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? titleTextStyle;
  // final bool? useAccentColor;
  final VoidCallback? onPressed;
  final Widget? child;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final bool useAccentColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      margin: margin,
      decoration: BoxDecoration(
        border: border,
        color: useAccentColor == false ? color : AppThemes.colorAccent,
        borderRadius: borderRadius,
      ),
      child: TextButton(
        // //不需要长按波纹效果
        // style: AppButtonStyles.getTransparentStyle(),
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: child != null ? child! : _buildTitle(),
      ),
    );
  }

  //提交按钮 = 背景色 + 白色Title
  _buildTitle() {
    return Text(title!,
        style: titleTextStyle ?? ThemeService().theme.textTheme.titleSmall?.copyWith(
            color: useAccentColor == false
                ? AppThemes.colorAccent
                : AppThemes.textPrimaryColorWhite));
  }
}
