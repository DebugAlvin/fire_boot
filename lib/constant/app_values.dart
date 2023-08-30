import 'dart:io';
import 'package:fire_boot/services/branch/branch.dart';
import 'app_branch_list.dart';

abstract class AppValues {
  ///**********: app values : **********
  static const String appName = '搜视短视频';
  static const String logo = 'assets/images/3.0x/application_icon.png';

  static const String registerPolicyUrl = 'https://www.baidu.com/';
  static const String privatePolicyUrl = 'https://www.baidu.com/';
  static const String userAgreementUrl = 'https://www.baidu.com/';
  static const String invitationFriendUrl = 'https://www.baidu.com/';

  ///**********: Branch values : **********
  static Branch defaultBranch = BranchList.dev;

  //**********: sdk values : **********
  static const String pangle_appId = "5345208";
  static const String pangle_splashId = "887982084";
  static final String jPushKey = Platform.isIOS
      ? "f18d9cf23ba77b36e4d526a8"
      : "f18d9cf23ba77b36e4d526a8";
  static final String channel = Platform.isIOS
      ? "ios"
      : "android";

  ///**********: radius values : **********
  static const double defaultRadius = 12;
  static const double radiusZero = 0;
  static const double smallRadius = 4.0;
  static const double radius_6 = 6;
  static const double radius_12 = 12;
  static const double largeRadius = 24;
  static const double roundedButtonRadius = 24;
  static const double extraLargeRadius = 36;

  ///**********: padding values : **********
  static const double defaultPadding = 15;
  static const double paddingZero = 0;
  static const double halfPadding = 8;
  static const double smallPadding = 10;
  static const double extraSmallPadding = 6;
  static const double largePadding = 24;
  static const double extraLargePadding = 32;
  static const double padding_4 = 4;
  static const double padding_2 = 2;
  static const double padding_3 = 3;
  static const double buttonVerticalPadding = 12;

  ///**********: margin values : **********
  static const double defaultMargin = 16;
  static const double marginZero = 0;
  static const double smallMargin = 8;
  static const double extraSmallMargin = 6;
  static const double largeMargin = 24;
  static const double margin_40 = 40;
  static const double margin_32 = 32;
  static const double margin_18 = 18;
  static const double margin_2 = 2;
  static const double margin_4 = 4;
  static const double margin_6 = 6;
  static const double margin_12 = 12;
  static const double margin_10 = 10;
  static const double margin_30 = 30;
  static const double margin_20 = 20;
  static const double extraLargeMargin = 36;
  static const double marginBelowVerticalLine = 64;
  static const double extraLargeSpacing = 96;

  ///**********: button values : **********
  /// 默认高度
  static const double defaultButtonHeight = 44;
  /// 默认宽度
  static const double defaultButtonMiniWidth = 84;
  /// 默认水平间距（CustomSmallMainButton使用）
  static const double defaultButtonHorizontalPadding = 6;
  /// 默认垂直间距（CustomSmallMainButton使用）
  static const double defaultButtonVerticalPadding = 8;
  static const double defaultBorderWith = 1;
  ///

  ///**********: elevation values : **********
  static const double elevation = 16;
  static const double smallElevation = 8;
  static const double extraSmallElevation = 4;
  static const double largeElevation = 24;

  ///**********: Image Sizes : **********
  static const double circularImageDefaultSize = 90;
  static const double circularImageSize_30 = 30;
  static const double circularImageDefaultBorderSize = 0;
  static const double circularImageDefaultElevation = 0;
  static const double momentThumbnailDefaultSize = 80;
  static const double momentSmallThumbnailDefaultSize = 32;
  static const double collectionThumbnailDefaultSize = 150;
  static const double defaultViewPortFraction = 0.9;
  static const int defaultAnimationDuration = 300;
  static const double listBottomEmptySpace = 20;
  static const double maxButtonWidth = 496;
  static const double stackedImageDefaultBorderSize = 4;
  static const double stackedImageDefaultSpaceFactor = 0.4;
  static const double stackedImageDefaultSize = 30;

  ///**********: Icon Sizes : **********
  static const double iconDefaultSize = 24;
  static const double emoticonDefaultSize = 22;
  static const double iconSize_20 = 20;
  static const double iconSize_22 = 22;
  static const double iconSize_18 = 18;
  static const double iconSmallSize = 16;
  static const double iconSmallerSize = 12;
  static const double iconSize_14 = 14;
  static const double iconSize_28 = 28;
  static const double iconLargeSize = 36;
  static const double iconExtraLargerSize = 96;
  static const double appBarIconSize = 32;

  ///**********: Custom AppBar Sizes : **********
  static const double customAppBarSize = 144.0;
  static const double collapsedAppBarSize = 70.0;

  ///**********: Pagination values : **********
  static const int defaultPageSize = 10;
  static const int defaultPageNumber = 1;

  ///**********: Time values : **********
  static const int defaultDebounceTimeInMilliSeconds = 1000;
  static const int defaultThrottleTimeInMilliSeconds = 500;

  ///**********: Extra : **********
  static const double fullViewPort = 1;
  static const double indicatorDefaultSize = 8;
  static const double indicatorShadowBlurRadius = 1;
  static const double indicatorShadowSpreadRadius = 0;
  static const double appbarActionRippleRadius = 50;
  static const double activeIndicatorSize = 8;
  static const double inactiveIndicatorSize = 10;
  static const double datePickerHeightOnIos = 270;
  static const int maxCharacterCountOfQuote = 108;
  static const double barrierColorOpacity = 0.4;

  static const double height_16 = 16;
}



class BranchList {
  // 获取线路地址
  static String line_url = '${baseAssetsList[0]}/app/json/domain.json';

  /// 可用api列表
  static List<String> baseProdApiList = [
    'https://h5.1234.com',
    'https://h5.1235.com',
  ];

  /// 可用静态资源列表，和可用api相对应
  static List<String> baseAssetsList = ['https://dl.sanbox.cc'];

  // 开发环境
  static final Branch dev = Branch(
    asset_url: 'http://dl.asset_url.com',
    api_url: "http://h5.api_url.com",
    cp_url: "http://cp.cp_url.com",
    chat_url: "http://chat.chat_url.com/main/home?d=app",
    ws_url: "0.0.0.0",
    port: 1891,
    log_url: "http://ht.log_url.com",
  );

  // 测试环境
  static final Branch test = Branch(
    asset_url: 'http://dl.asset_url.com',
    api_url: "http://h5.api_url.com",
    cp_url: "http://cp.cp_url.com",
    chat_url: "http://chat.chat_url.com/main/home?d=app",
    ws_url: "0.0.0.0",
    port: 1891,
    log_url: "http://ht.log_url.com",
  );

  // 生产环境
  static final Branch prod = Branch(
    asset_url: baseAssetsList[0],
    api_url: baseProdApiList[0],
    cp_url: "http://cp.cp_url.com",
    chat_url: "http://chat.chat_url.com/main/home?d=app",
    ws_url: "0.0.0.0",
    port: 1891,
    log_url: "http://ht.log_url.com",
  );
}