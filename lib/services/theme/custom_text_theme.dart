import 'package:flutter/material.dart';
import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/constant/app_values.dart';

/// @method : textTheme
/// @description :AppTextStyles文本主题颜色配置
/// TextTheme详细解，http://t.zoukankan.com/sundaysme-p-13545038.html
/// 以下是2018的设计规范，在2021中已经弃用，不要混用！
/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5

class CustomTextTheme {
  static TextTheme defaultTheme({required bool isDark}) {
    return const TextTheme().copyWith(
      ///title，一般用于card widget的标题
      titleSmall: TextStyle(
          fontSize: AppValues.fontTileSmallSize,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textColorWhite
              : AppThemes.textColorDark),
      titleMedium: TextStyle(
          fontSize: AppValues.fontTitleMediumSize,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textColorWhite
              : AppThemes.textColorDark),
      titleLarge: TextStyle(
          fontSize: AppValues.fontTileLargeSize,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textColorWhite
              : AppThemes.textColorDark),

      ///body，正文内容，一般用于商品详情介绍
      bodySmall: TextStyle(
          fontSize: AppValues.fontBodySmallSize,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textColorWhite
              : AppThemes.textColorDark),
      bodyMedium: TextStyle(
          fontSize: AppValues.fontBodyMediumSize,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textColorWhite
              : AppThemes.textColorDark),
      bodyLarge: TextStyle(
          fontSize: AppValues.fontBodyLargeSize,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textColorWhite
              : AppThemes.textColorDark),

      ///小于display样式大于title样式
      ///在较小屏幕上显示简短、高度强调的文本。
      headlineSmall: TextStyle(
          fontSize: AppValues.fontHeadlineSmallSize,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textColorWhite
              : AppThemes.textColorDark),

      /// 最小的文字
      labelSmall: const TextStyle(
          fontSize: AppValues.fontLabelSmallSize,
          fontWeight: FontWeight.normal,
          color: AppThemes.textColorSecondary),

      /// 用于与图像关联的辅助文本,最大号
      labelLarge: const TextStyle(
          fontSize: AppValues.fontLabelLargeSize,
          fontWeight: FontWeight.normal,
          color: AppThemes.textColorSecondary),

      ///用于与图像关联的辅助文本。
      labelMedium: const TextStyle(
          fontSize: AppValues.fontLabelMediumSize,
          fontWeight: FontWeight.normal,
          color: AppThemes.textColorSecondary),
    );
  }

}