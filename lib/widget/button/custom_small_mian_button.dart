import 'dart:math';
import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/services/theme/extention/button_theme_data_extension.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';

///
/// 小的主色调按钮
///
/// 当按钮文本的宽度于[themeData.minWidth]时，按钮宽度等于[themeData.minWidth]
/// 当按钮文本的宽度大于[themeData.minWidth]时，按钮宽度等于[titleWidth] + [themeData.horizontalPadding] * 2
/// 按钮高度等于[titleHeight] + [themeData.horizontalPadding] * 2
///
/// 按钮是圆角矩形的形状，只支持设置圆角大小[radius],不支持改变形状。
///
/// 按钮也存在可用和不可用两种状态，[isEnable]如果设置为false，那么按钮呈现灰色态，点击事件不响应
///
/// 举例,当文本长度超过minWidth时，按钮内间距是EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6)
///
/// 其他按钮如下：
///  * [CustomSmallOutlineButton], 小主色调按钮
///
///

class CustomSmallMainButton extends StatelessWidget {
  /// 按钮显示文案,默认'确认'
  final String? title;

  ///点击回调
  final VoidCallback? onTap;

  ///是否可用，默认为true。false为不可用：置灰、不可点击。
  final bool isEnable;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;

  /// 默认[themeData.borderRadius]
  final double? radius;
  final double? maxWidth;
  final double? width;

  /// 文字样式，优先级:
  /// [textStyle] > [textTheme]
  final TextStyle? textStyle;

  /// 配置按钮样式，优先级最低
  final ButtonThemeData? themeData;

  /// 配置默认文字样式，优先级最低
  final TextTheme? textTheme;

  const CustomSmallMainButton({
    Key? key,
    this.title,
    this.onTap,
    this.isEnable = true,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.radius,
    this.maxWidth,
    this.width,
    this.themeData,
    this.textStyle,
    this.textTheme,
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
                .copyWith(color: textColor ?? defaultThemeData.mainTextColor);
        if (fontSize != null) {
          style = style.copyWith(fontSize: fontSize!);
        }
        textPainter.textDirection = TextDirection.ltr;
        textPainter.text = TextSpan(text: title ?? '', style: style);
        textPainter.layout(maxWidth: con.maxWidth);
        double textWidth = textPainter.width;
        //按钮本身大小
        double _maxWidth = textWidth + defaultThemeData.horizontalPadding * 2;
        double _minWidth = min(defaultThemeData.minWidth, con.maxWidth);

        //保证最小宽度是 （84、可用空间）的最小值
        if (_maxWidth <= _minWidth) {
          _maxWidth = _minWidth;
        } else {
          //外部要求最大宽度
          if (maxWidth != null) {
            if (_maxWidth > maxWidth!) {
              _maxWidth = maxWidth!;
            }
          }
        }

        if (_maxWidth > con.maxWidth) {
          _maxWidth = con.maxWidth;
        }

        return CustomButton(
          isEnable: isEnable,
          constraints: BoxConstraints(
            minWidth: width ?? _minWidth,
            maxWidth: width ?? _maxWidth,
          ),
          alignment: Alignment.center,
          title: title,
          textColor: defaultThemeData.mainTextColor,
          backgroundColor: _getBackgroundColor(defaultThemeData),
          disableBackgroundColor:
              _getBackgroundColor(defaultThemeData).withOpacity(0.7),
          borderRadius: defaultThemeData.borderRadius,
          onTap: onTap,
          textStyle: style,
        );
      },
    );
  }

  Color _getBackgroundColor(ButtonThemeData theme) {
    return backgroundColor ??
        theme.colorScheme?.primary ??
        ThemeService().theme.colorScheme.primary;
  }
}
