import 'package:flutter/material.dart';

/// @class : AppThemes
/// @date : 2023/01/06
/// @name : alvin
/// @description : 一些主题色的常量

class AppThemes {
  ///general color name
  static const black = Color(0xFF000000);
  static const milkWhite = Color(0xFFFAFBFD);
  static const blueBayoux = Color(0xff38686A);
  static const bloodRed = Color(0xFFFFBF00);

  static Color greyWithOpacityHalf = Colors.grey.withOpacity(0.5);
  static const lightGray = Color(0xFFA6A6A6);
  static const darkGray = Color(0xFFEDEFF2);
  static const goldOrange = Color(0xFFFC9300);
  static const skyBlue = Color(0xFF329CFF);
  static const grassGreen = Color(0xFF81B337);
  static const goldYellow = Color(0xFFF9DD9D);
  static const yolkYello = Color(0xFFFFF9E6);
  static const matchGreen = Color(0xFF426729);

  ///theme color
  ///Scaffold的默认颜色典型Material应用程序或应用程序内页面的背景颜色
  static const pageLightBackground = Color(0xFFF7F7FC);//浅色风格
  static const pageDarkBackground = Color(0xFF010101);//暗黑风格
  ///交互性颜色。这颜色一般用于交互性的控件颜色
  ///比如FloatingButton、TextField、Cursor、ProgressBar、Selection、Links等具体交互性的颜色
  static const Color colorAccent = Color(0xFFFC9300);
  ///主题颜色，app的主要颜色，即整个屏幕和所有控件的主要颜色，首选颜色。
  static const Color primaryColor = bloodRed;
  ///Material默认长按波纹颜色
  static const Color rippleColor = Color(0x33E2E3E8);
  ///阴影颜色
  static const Color colorShadow = Color(0x66E0E6FD);

  //card color
  static const Color cardColorLight = Color(0xFFFFFFFF);
  static const Color cardColorDart = Color(0xFFFFFFFF);

  ///widget color
  static const Color bottomAppBarColorDark = Color(0xFF161616);
  static const Color dividerColor = Color(0xFFF2F4F7);
  static Color elevatedContainerColorOpacity = greyWithOpacityHalf;
  static Color statusBarColor = pageLightBackground;

  ///text color
  static const Color textPrimaryColorDark = Color(0xFF4D4D4D);
  static const Color textPrimaryColorWhite = Color(0xFFFFFFFF);
  static const Color textColorSecondary = textColorGrey;
  static const Color textColorGrey = lightGray;
  static const Color textColorGreyLight = lightGray;
  ///  辅助，用于图标、文字颜色
  static const Color textColorRed = Color(0xFFEC5F48);
  static const Color textColorBlue = skyBlue;
  static const Color textColorGreen = grassGreen;
  ///  辅助，用于图标、按钮、文字颜色
  static const Color textColorOrange = goldOrange;
  ///  辅助，用于按钮、文字颜色
  static const Color textColorWhite = Color(0xFFE1E3e6);

  ///bar color
  static const Color appBarColorDark = Colors.transparent;
  static const Color appBarColorWhite = Color(0xFFFFFFFF);
  static const Color appBarIconColorDark = Color(0xFF060001);
  static const Color appBarIconColorWhite = Color(0xFFFFFFFF);
  static const Color appBarTextColorDark = Color(0xFF060001);
  static const Color appBarTextColorWhite = Color(0xFFFFFFFF);

  /// 用于提示文本或占位符文本的颜色
  /// 例如在TextField中
  static const Color hintColor = Color(0xFF979797);
  static const Color serachBarHintColor = Color(0xFFF2F4F7);
  static const Color matchCardUnCollect = Color(0xFF707070);
  static const Color bottomInputFiledFillColor = Color(0xFFF2F4F7);
  static const Color invitationfriendPagebackgroundColor = Color(0xFFFFCA81);
  static const Color scoreRecordTagBackground = Color(0xFFF9E7DF);
  static const Color SecuritiesCardTitleColor = Color(0xFF874C09);
  static const Color basketballTabBackgroundColor = Color(0xFFEDEDF2);
  static const Color textTagBackgroundColor = Color(0xFFF7F0F0);
  static const Color timelineEventBackgroundColor = Color(0xFFFBF3E9);
  static const Color progressBackgroundColor = Color(0xFFAFBECC);
  static const Color yellowCard = Color(0xFFFFD500);
  static const Color redCard = Color(0xFFCC0000);
  static const Color tabBarIconColorSelected = Color(0xFFFCC100);
  static const Color tabBarIconColorUnselected = Color(0xFFA9B5C4);
  static const Color tagLivingBackgroundColor = Color(0xFFFFE6E6);
  static const Color userFollowButtonBackground = Color(0xFFFFF2CC);
  static const Color basketballBackground = Color(0xFF806440);
  static const Color matchGameFinishStatus = Color(0xFFD1C295);
  static const Color esportBackgrouund = Color(0xFF394058);
  static const Color basketIconColor = Color(0xFFA16600);
  static const Color csgoIconColor = Color(0xFFFFA817);
  static const Color lolIconColor = Color(0xFFFF4029);
  static const Color dota2IconColor = Color(0xFFFF611A);
  static const Color kogIconColor = Color(0xFFF3B55B);
  static const Color SecuritiesVipGold = Color(0xFFFFE9BE);
  static const Color warningBackground = Color(0xFFFFFCF2);
  static const Color incomeTopBackground = Color(0xFFDFE6F2);
  static const Color incomeTopStartGradientBackground = Color(0xFFA1B3D0);
  static const Color incomeTopEndGradientBackground = Color(0xFF5B628F);
  static const Color incomePageDivider = Color(0xFFACC5DC);
  static const Color basketballMatchBallColor = Color(0xFF0074E0);

  static const Color statusBarColorWhite = Color(0xFFFFFFFF);
  static const Color statusBarColorDark = Color(0xFF000000);
  static const Color anchorDoesExists = Color(0xFF303030);

  ///遮罩，用于和背景形成对比
  static Color maskDeepColor = Colors.black.withOpacity(0.2);
  static Color maskLightColor = Colors.transparent;


  ///button
  static const Color buttonDisableBackgroundColor = Color(0xFFCCCCCC);
  static Color buttonDisableTextColor = Colors.white.withOpacity(0.7);


  static Color fanGroupButtonStartColor = const Color(0xFFFFCC47);
  static Color fanGroupButtonEndColor = const Color(0xFFFC7600);
  static Color fanGroupBlueButtonStartColor = const Color(0xFFA5ACFF);
  static Color fanGroupBlueButtonEndColor = const Color(0xFFA5ACFF);
  static const Color badgeUsingColor = Color(0xFFFFECB2);

}