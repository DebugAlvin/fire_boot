import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show TextHeightBehavior;

enum CustomTextColorStyle {
  ///默认暗合模式明亮模式自适应的方案
  normal,
  ///白天模式字体是黑色的,暗黑模式字体白色
  panda,
  dark,
  white,
  primary,
  secondary,
  grey,
  lightGrey,
}

extension CustomTextColorStyleExtension on CustomTextColorStyle {
  Color? get value {
    final colorScheme = ThemeService().colorScheme;
    Color? textColor;
    switch (this) {
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
      case CustomTextColorStyle.secondary:
        textColor = AppThemes.textColorSecondary;
        break;
      case CustomTextColorStyle.panda:
        textColor = (ThemeService.instance.isDarkMode)
            ? AppThemes.textColorWhite
            : AppThemes.textColorDark;
        break;
      default:
        textColor = (ThemeService.instance.isDarkMode)
            ? AppThemes.textColorWhite
            : AppThemes.textColorDark;
    }
    return textColor;
  }
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
  final TextTheme? textTheme;
  final CustomTextColorStyle? textColorStyle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultTextTheme = textTheme ?? ThemeService().theme.textTheme;
    return Text(
      data,
      style: _getTextStyle(defaultTextTheme),
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

  TextStyle? _getTextStyle(TextTheme textTheme) {
    Color? textColor;
    final defaultTextStyle = style ?? textTheme.bodyMedium;
    if(textColorStyle != null) {
      textColor = textColorStyle!.value;
    }
    return defaultTextStyle?.copyWith(color: textColor!);
  }
}
