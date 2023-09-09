import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show TextHeightBehavior;

enum CustomTextColorStyle {
  ///暗合模式明亮模式自适应
  normal,
  dark,
  white,
  primary,
  grey,
  lightGrey,
}

class CustomText extends StatelessWidget {
  const CustomText(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.colorScheme,
    this.textTheme,
    this.textColorStyle,
  });

  final String data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final ColorScheme? colorScheme;
  final TextTheme? textTheme;
  final CustomTextColorStyle? textColorStyle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultColorScheme = colorScheme ?? ThemeService().theme.colorScheme;
    final defaultTextTheme = textTheme ?? ThemeService().theme.textTheme;
    return Text(
      data,
      style: _getTextStyle(defaultTextTheme, defaultColorScheme),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }

  TextStyle? _getTextStyle(TextTheme textTheme, ColorScheme colorScheme) {
    Color? textColor;
    final defaultTextStyle = style ?? textTheme.bodyMedium;
    switch (textColorStyle) {
      case CustomTextColorStyle.normal:
        textColor = colorScheme.onSurface;
        break;
      case CustomTextColorStyle.white:
        textColor = AppThemes.textColorWhite;
        break;
      case CustomTextColorStyle.dark:
        textColor = AppThemes.textColorDark;
        break;
      case CustomTextColorStyle.grey:
        textColor = AppThemes.textColorGrey;
        break;
      case CustomTextColorStyle.lightGrey:
        textColor = AppThemes.textColorLightGrey;
        break;
      case CustomTextColorStyle.primary:
        textColor = colorScheme.primary;
        break;
    }

    return textColor == null
        ? defaultTextStyle
        : defaultTextStyle?.copyWith(color: textColor!);
  }
}
