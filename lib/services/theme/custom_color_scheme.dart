import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';

/// @class : CustomColorScheme
///调色板
///配色规则请参考资料:
///https://m3.material.io/styles/color/the-color-system/color-roles
class CustomColorScheme {
  static ColorScheme defaultColorScheme({required bool isDark}) {
    return ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,

      /// primary主要基色
      primary: ThemeService.instance.primaryColor,

      /// On-primary 适用于位于primary之上的内容（图标、文本等）
      onPrimary: isDark ? AppThemes.textColorDark : AppThemes.textColorWhite,

      /// primaryContainer 应用于需要比主容器更少强调的元素,通常来说比primary颜色更浅
      primaryContainer: AppThemes.primaryContainer,

      /// onPrimaryContainer 适用于位于primaryContainer之上的内容（图标、文本等）
      onPrimaryContainer: AppThemes.onPrimaryContainer,

      ///另一种不常见的主题色,比
      secondary: AppThemes.secondaryColor,
      onSecondary: AppThemes.onSecondaryColor,

      tertiary: AppThemes.tertiaryColor,
      onTertiary: AppThemes.onTertiaryColor,

      /// 在[背景]上绘制时清晰可见的颜色，我们常说白纸黑字，黑纸白字
      background:
          isDark ? AppThemes.pageDarkBackground : AppThemes.pageLightBackground,
      onBackground: isDark
          ? AppThemes.textColorWhite
          : AppThemes.textColorDark,

      /// 在[表面]上绘制时清晰可见的颜色，通常用于ListView、Container的背景颜色。
      /// surface通常在background里面的widget,例如TabBar的背景颜色
      surface: isDark ? AppThemes.surfaceColor : AppThemes.pageLightBackground,
      onSurface:  isDark ? AppThemes.onSurfaceColor : AppThemes.textColorDark,

      ///和surface相反的颜色
      inverseSurface: isDark ? AppThemes.textColorWhite : AppThemes.textColorDark,
      onInverseSurface: isDark ? AppThemes.textColorDark : AppThemes.textColorWhite,

      /// surfaceVariant另一种和surface产生区别的背景色,例如ListView Card背景色
      surfaceVariant: AppThemes.surfaceVariant,
      onSurfaceVariant: AppThemes.onSurfaceVariant,

      ///错误提示的颜色
      error: AppThemes.errorColor,
      onError: AppThemes.onErrorColor,
    );
  }
}
