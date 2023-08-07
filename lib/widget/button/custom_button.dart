import 'package:fire_boot/services/theme/extention/button_theme_data_extension.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/utils/widget_util.dart';
import 'package:flutter/material.dart';

/// @class : CustomButton
/// @date : 2023/08/05
/// @name : alvin

/// 通用按钮，支持用户设置背景色、是否可用等属性
/// 若[CustomBigMainButton]、[CustomSmallMainButton]、[CustomBigOutlineButton]不能满足用户需要
/// 可以直接使用该按钮
///
/// [isEnable]如果设置为false，那么按钮呈现灰色态，点击事件不响应
///
/// 默认使用[Text]文本组件，如果用户想要显示其他组件。比如图片等，可以设置[child]属性
///
/// 文本组件需要的样式属性，可以通过[textStyle]设置，也可以通过[fontSize]等单独设置
///
/// 该组件的布局规则参考[Container]的布局规则
/// 该组件的[alignment]的属性默认为null,即使父布局给的约束是无边界(最大宽度或者最大高度是double.infinity.)
/// 组件的尺寸也会和child一样大。
/// 那就是说：不给[alignment]属性设置值，即使把[CustomButton],放到[column]、[ListView]中，
/// 他也会尽可能的小。如果设置了[constraints]属性，那么就会按着[constraints]布局。
///
/// 案例一
/// ```dart
/// CustomButton(
///    text: '主案特别长',
///    onTap: () {
///         CustomToast.show('点击了主按钮', context);
///    },
/// )
/// ```
/// 按钮的大小就是text的大小+内边距的大小
///
/// 案例二
/// ```dart
/// CustomButton(
///    constraints: BoxConstraints.expand(height: 60),
///    text: '主案特别长',
///    onTap: () {
///         CustomToast.show('点击了主按钮', context);
///    },
/// )
/// ```
/// 按钮的大小：宽度充满父布局、高度是60
///
/// 如果给该组件的[alignment]赋值了，父布局的约束是有边界。
/// 该组件的尺寸就是父布局的约束， 并且会按着[alignment]属性来摆放[text]或者[child],比如居中摆放等.
///
/// 案例一
/// ```dart
/// CustomButton(
///    alignment: Alignment.center,
///    text: '主案特别长',
///    onTap: () {
///         CustomToast.show('点击了主按钮', context);
///    },
/// )

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.title = '',
    this.borderRadius,
    this.child,
    this.alignment,
    this.textStyle,
    this.themeData,
    this.isEnable = true,
    this.onTap,
    this.backgroundColor = Colors.transparent,
    this.disableBackgroundColor = Colors.transparent,
    this.decoration,
    this.padding,
    this.constraints,
    this.textColor,
    this.disableTextColor = Colors.transparent,
    this.textTheme,
  }) : super(key: key);

  CustomButton.outline({
    Key? key,
    Color? disableLineColor,
    Color? lineColor,
    double borderWith = 1.0,
    required this.title,
    this.isEnable = true,
    this.backgroundColor = Colors.transparent,
    this.disableBackgroundColor = Colors.transparent,
    this.alignment,
    this.child,
    this.onTap,
    this.textColor,
    this.disableTextColor,
    this.padding,
    this.textStyle,
    this.constraints,
    this.borderRadius,
    this.themeData,
    this.textTheme,
  })  : decoration = _OutlineBoxDecorationCreator.createOutlineBoxDecoration(
      isEnable: isEnable ?? true,
      disableLineColor: disableLineColor,
      lineColor: lineColor,
      disableBackgroundColor: disableBackgroundColor ?? Colors.transparent,
      backgroundColor: backgroundColor ?? Colors.transparent,
      borderRadius: borderRadius ?? BorderRadius.zero,
      borderWith: borderWith),
        super(key: key);

  /// 按钮显示的文案
  final String? title;

  /// 按钮的文本显示样式 优先级:
  /// [textStyle] > [AppValues.defaultTitleSmall] > [themeData.textTheme.titleSmall]
  final TextStyle? textStyle;

  /// 按钮点击的回调
  final VoidCallback? onTap;

  ///按钮的显示子节点 优先级高于[text]
  final Widget? child;

  /// 按钮的内部对齐 默认为null
  final AlignmentGeometry? alignment;

  /// 按钮的修饰 默认实色背景
  final Decoration? decoration;

  /// 按钮内边距 默认为null
  final EdgeInsetsGeometry? padding;

  /// 按钮的布局约束 默认是自适应大小
  final BoxConstraints? constraints;

  /// 按钮不可用背景色 默认为透明色
  final Color? disableBackgroundColor;

  ///按钮背景色,默认为透明色
  final Color? backgroundColor;

  /// 按钮的文字颜色 优先级：
  /// [textStyle.color] > [textColor] > [colorScheme.primary]
  final Color? textColor;

  /// 按钮圆角大小,优先级:
  /// [borderRadius] > [themeData.buttonTheme.borderRadius]
  final BorderRadiusGeometry? borderRadius;

  /// 按钮不可用的文字颜色 默认为透明色
  final Color? disableTextColor;

  /// 按钮是否可用 默认是true
  final bool? isEnable;

  ///默认主题配置
  final ButtonThemeData? themeData;

  ///默认主题配置
  final TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultTheme = themeData ?? ThemeService().theme.buttonTheme;
    // textColor ?? defaultTheme.colorScheme?.primary;
    final defaultTextTheme = textTheme ?? ThemeService().theme.textTheme;
    return GestureDetector(
      onTap: () {
        if (WidgetUtil.isMultiClick()) {
          return;
        }
        if (isEnable == true && onTap != null) {
          onTap!();
        }
      },
      child: Container(
        alignment: alignment,
        decoration: decoration ?? _getBoxDecoration(_getBackgroundColor()),
        constraints: constraints,
        padding: padding ??
            EdgeInsets.symmetric(
                vertical: defaultTheme.verticalPadding,
                horizontal: defaultTheme.horizontalPadding),
        child: child ?? _buildTitle(defaultTheme,defaultTextTheme),
      ),
    );
  }

  Text _buildTitle(ButtonThemeData themeData,TextTheme textTheme) {
    Color? textColor;
    if (isEnable == true) {
      textColor = this.textColor ?? themeData.colorScheme?.primary;
    } else {
      textColor = disableTextColor ?? (this.textColor)?.withOpacity(0.7);
    }
    return Text(title!,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: textStyle ?? textTheme.bodyMedium?.copyWith(color: textColor));
  }

  Color? _getBackgroundColor() {
    return isEnable == true ? backgroundColor : disableBackgroundColor;
  }

  BoxDecoration _getBoxDecoration(Color? bgColor) {
    return BoxDecoration(
      color: bgColor,
      borderRadius: borderRadius,
    );
  }
}

class _OutlineBoxDecorationCreator {
  static BoxDecoration createOutlineBoxDecoration({
    required bool isEnable,
    Color? disableLineColor,
    Color? lineColor,
    required Color backgroundColor,
    required Color disableBackgroundColor,
    required BorderRadiusGeometry borderRadius,
    double borderWith = 1.0,
  }) {
    Color _lineColor = isEnable ? lineColor! : disableLineColor!;
    Color _bgColor = isEnable ? backgroundColor : disableBackgroundColor;

    return BoxDecoration(
        border: Border.all(color: _lineColor, width: borderWith),
        borderRadius: borderRadius,
        color: _bgColor);
  }
}