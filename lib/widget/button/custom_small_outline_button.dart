import 'dart:math';
import 'package:fire_boot/services/theme/extension/button_theme_data_extension.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

/// 边框 小、次按钮，小灰框，默认按钮确认,支持自定义边框、文字颜色

/// 小的边框按钮
/// 该按钮有一个最小的宽度84，在此基础上，宽度随着文本内容的多少变更
///
/// 按钮是圆角矩形的形状，只支持设置圆角大小[radius],不支持改变形状。
///
/// 按钮也存在可用和不可用两种状态，[isEnable]如果设置为false，那么按钮呈现灰色态，点击事件不响应
///

class CustomSmallOutlineButton extends StatelessWidget {
  /// 按钮显示文案,默认'确认
  final String? title;

  /// 点击的回调
  final VoidCallback? onTap;

  ///是否可用，默认为true。false为不可用：置灰、不可点击。
  final bool isEnable;

  /// 边框的颜色，边框颜色，
  final Color? lineColor;

  /// 文字颜色
  final Color? textColor;

  ///圆角,默认[themeData.borderRadius]
  final double? radius;

  ///宽度
  final double? width;

  ///字体大小
  final double? fontSize;

  /// 文字样式，优先级:
  /// [textStyle] > [textTheme]
  final TextStyle? textStyle;

  /// 配置按钮样式，优先级最低
  final ButtonThemeData? themeData;

  /// 配置按钮文字样式，优先级最低
  final TextTheme? textTheme;

  const CustomSmallOutlineButton({
    Key? key,
    this.title,
    this.onTap,
    this.isEnable = true,
    this.lineColor,
    this.textColor,
    this.radius,
    this.width,
    this.fontSize,
    this.themeData,
    this.textTheme,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultThemeData = themeData ?? ThemeService().theme.buttonTheme;
    final defaultTextTheme = textTheme ?? ThemeService().theme.textTheme;

    TextPainter textPainter =
        TextPainter(textScaleFactor: MediaQuery.of(context).textScaleFactor);

    return LayoutBuilder(
      builder: (_, con) {
        TextStyle style = textStyle ??
            defaultTextTheme!.bodyMedium!
                .copyWith(color: _getTextColor(defaultThemeData));
        if (fontSize != null) {
          style = style.copyWith(fontSize: fontSize!);
        }
        textPainter.textDirection = TextDirection.ltr;
        textPainter.text = TextSpan(text: title ?? '', style: style);
        textPainter.layout(maxWidth: con.maxWidth);
        double textWidth = textPainter.width;
        double _maxWidth = textWidth +
            defaultThemeData.horizontalPadding * 2 +
            2 * defaultThemeData.borderWith;

        double _minWidth = min(defaultThemeData.borderWith, con.maxWidth);
        if (_maxWidth <= _minWidth) {
          _maxWidth = _minWidth;
        }
        if (_maxWidth > con.maxWidth) {
          _maxWidth = con.maxWidth;
        }

        return CustomButton.outline(
          constraints: BoxConstraints(
            minWidth: width ?? _minWidth,
            maxWidth: width ?? _maxWidth,
          ),
          borderWith: defaultThemeData.borderWith,
          borderRadius: defaultThemeData.borderRadius,
          title: title,
          disableLineColor: defaultThemeData.disableBorderColor,
          lineColor: lineColor ?? defaultThemeData.borderColor,
          textColor: _getTextColor(defaultThemeData),
          isEnable: isEnable,
          alignment: Alignment.center,
          onTap: onTap,
          backgroundColor: defaultThemeData.colorScheme?.background,
          disableTextColor: defaultThemeData.outLineDisableTextColor,
          disableBackgroundColor: defaultThemeData.colorScheme?.background,
        );
      },
    );
  }

  Color _getTextColor(ButtonThemeData theme) {
    return textColor ?? theme.borderColor;
  }
}
