import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/services/theme/extension/button_theme_data_extension.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

/// 页面中的主按钮,支持动态设置背景颜色，置灰
///
/// 和[CustomSmallMainButton]相比，该按钮是占据父节点分配的最大可用空间，按钮文案居中对齐
///
/// 按钮高度固定等于[themeData.height]
///
/// 按钮是圆角矩形的形状，不支持改变形状。
///
/// 按钮也存在可用和不可用两种状态，[isEnable]如果设置为false，那么按钮呈现灰色态，点击事件不响应
///
/// 大的 提交 按钮
/// CustomBigMainButtonWidget(
///    title: '提交',
/// )
///
/// CustomBigMainButtonWidget(
///   title: '提交',
///   isEnable: false,
///   onTap: () {
///     CustomToast.show('点击了主按钮', context);
///   },
/// ),

/// 其他按钮如下：
///  * [CustomBigGhostButton], 大主色调的幽灵按钮
///  * [CustomBigOutlineButton], 大边框按钮
class CustomBigMainButton extends StatelessWidget {
  ///按钮显示文案,默认'确认'
  final String? title;

  ///是否可用,true 使用主题色，false置灰
  final bool? isEnable;

  ///点击回调
  final VoidCallback? onTap;

  ///默认父布局可用空间,优先级
  ///[minWidth] > [double.infinity]
  final double? minWidth;

  ///背景颜色
  final Color? backgroundColor;

  /// 按钮圆角大小,优先级:
  /// [borderRadius] > [themeData.buttonTheme.borderRadius]
  final BorderRadiusGeometry? borderRadius;

  ///主题管理器
  final ButtonThemeData? themeData;

  const CustomBigMainButton(
      {super.key,
      this.title,
      this.isEnable = true,
      this.onTap,
      this.minWidth,
      this.backgroundColor,
      this.themeData,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultTheme = themeData ?? ThemeService().theme.buttonTheme;
    return CustomButton(
      constraints: BoxConstraints.tightFor(
          width: minWidth ?? double.infinity, height: defaultTheme.height),
      alignment: Alignment.center,
      isEnable: isEnable,
      title: title,
      borderRadius: borderRadius ?? defaultTheme.borderRadius,
      backgroundColor: _getBackgroundColor(defaultTheme),
      disableBackgroundColor: _getBackgroundColor(defaultTheme).withOpacity(0.7),
      onTap: onTap,
      textColor: defaultTheme.whiteColor,
      disableTextColor: defaultTheme.whiteColor.withOpacity(0.7),
    );
  }

  Color _getBackgroundColor(ButtonThemeData theme) {
    return backgroundColor ?? theme.colorScheme?.primary ?? ThemeService().theme.colorScheme.primary;
  }
}

