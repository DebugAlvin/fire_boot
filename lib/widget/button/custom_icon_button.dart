import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';

/// CustomIconButton组件，基于[CustomIconButton]组件图文组合组件
/// 为了解决icon和文字组合的问题
/// 图文的方向 bottom、文字在下 icon在上 top、文字在上 icon在下
/// Left、文字在左 icon在右 right、文字在右 icon在左

enum Direction {
  /// 文字在左边
  left,

  /// 文字在右边
  right,

  /// 文字在上边
  top,

  /// 文字在下边
  bottom,
}

class CustomIconButton extends StatefulWidget {
  /// icon的文案
  final String? name;

  /// 需要传的icon
  final Widget? iconWidget;

  /// 点击的回调
  final VoidCallback? onTap;

  /// 文字相对于图片的位置
  final Direction direction;

  /// 图片宽度，默认 24
  final double iconWidth;

  /// 图片高度，默认 24
  final double iconHeight;

  ///  文字样式
  final TextStyle? style;

  /// 图文组合的宽度，默认 80
  final double widgetWidth;

  /// 图文组合的高度，默认 80
  final double widgetHeight;

  /// 文字和图片的间距，默认 4
  final double padding;

  /// 图文对齐方式，默认 MainAxisAlignment.center
  final MainAxisAlignment mainAxisAlignment;

  final TextTheme? textTheme;

  final IconThemeData? iconThemeData;

  const CustomIconButton(
      {Key? key,
      this.name,
      this.iconWidget,
      this.onTap,
      this.direction = Direction.top,
      this.iconWidth = 24,
      this.iconHeight = 24,
      this.style,
      this.widgetWidth = 80,
      this.widgetHeight = 80,
      this.padding = 4,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.textTheme,
      this.iconThemeData})
      : super(key: key);

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultTextTheme = widget.textTheme ?? ThemeService().theme.textTheme;
    final SizedBox ctn;
    // 图文的方向 bottom、文字在下 icon在上 top、文字在上 icon在下
    // Left、文字在左 icon在右 right、文字在右 icon在左
    if (widget.direction == Direction.bottom) {
      ctn = SizedBox(
          height: widget.widgetHeight,
          width: widget.widgetWidth,
          child: Column(
            mainAxisAlignment: widget.mainAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // 图片
              SizedBox(
                height: widget.iconHeight,
                width: widget.iconWidth,
                child: FittedBox(fit: BoxFit.contain, child: widget.iconWidget),
              ),
              _buildText(
                  defaultTextTheme, EdgeInsets.only(top: widget.padding)),
            ],
          ));
    } else if (widget.direction == Direction.left) {
      ctn = SizedBox(
          height: widget.widgetHeight,
          width: widget.widgetWidth,
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // 图片
              SizedBox(
                  // alignment: Alignment.center,
                  height: widget.iconHeight,
                  width: widget.iconWidth,
                  child: widget.iconWidget),
              _buildText(
                  defaultTextTheme, EdgeInsets.only(left: widget.padding)),
            ],
          ));
    } else if (widget.direction == Direction.right) {
      ctn = SizedBox(
          height: widget.widgetHeight,
          width: widget.widgetWidth,
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildText(
                  defaultTextTheme, EdgeInsets.only(right: widget.padding)),
              // 图片
              SizedBox(
                  height: widget.iconHeight,
                  width: widget.iconWidth,
                  child: widget.iconWidget),
            ],
          ));
    } else {
      ctn = SizedBox(
          height: widget.widgetHeight,
          width: widget.widgetWidth,
          child: Column(
            mainAxisAlignment: widget.mainAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildText(
                  defaultTextTheme, EdgeInsets.only(bottom: widget.padding)),
              // 图片
              SizedBox(
                height: widget.iconHeight,
                width: widget.iconWidth,
                child: widget.iconWidget,
              ),
            ],
          ));
    }

    if (widget.onTap != null) {
      return GestureDetector(
        child: ctn,
        onTap: () {
          widget.onTap!();
        },
      );
    }
    return ctn;
  }

  _buildText(TextTheme textTheme, EdgeInsetsGeometry padding) {
    return widget.name != null
        ? Padding(
            padding: padding,
            child: Text(
              widget.name!,
              style: widget.style ?? textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
          )
        : const SizedBox.shrink();
  }
}
