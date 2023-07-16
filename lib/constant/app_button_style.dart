import 'package:flutter/material.dart';

import 'app_themes.dart';

/// @class : ButtonStyles
/// @date : 2022/10/09
/// @name : alvin
/// @description :ButtonStyles样式
class AppButtonStyles {

  /// Button公共样式，默认点击效果
  /// [ButtonStyle]
  static ButtonStyle getButtonStyle(){
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(AppThemes.rippleColor),
      animationDuration:const Duration(milliseconds: 200),
      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
      shape: MaterialStateProperty.all(const StadiumBorder()),
    );
  }

  /// Button公共样式，无点击效果
  /// [ButtonStyle]
  static ButtonStyle getTransparentStyle(){
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(0)),
    );
  }


  /// Button公共样式，无圆角
  /// [ButtonStyle]
  static ButtonStyle getNoShapeStyle(){
    return ButtonStyle(
      shadowColor: MaterialStateProperty.all(AppThemes.colorShadow),
      animationDuration:const Duration(milliseconds: 200),
      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
    );
  }
}