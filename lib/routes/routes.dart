import 'package:fire_boot/pages/find/binding.dart';
import 'package:fire_boot/pages/find/view.dart';
import 'package:fire_boot/pages/home/binding.dart';
import 'package:fire_boot/pages/home/view.dart';
import 'package:fire_boot/pages/main/binding.dart';
import 'package:fire_boot/pages/main/view.dart';
import 'package:fire_boot/pages/match/detail/binding.dart';
import 'package:fire_boot/pages/match/detail/view.dart';
import 'package:fire_boot/pages/message/binding.dart';
import 'package:fire_boot/pages/message/view.dart';
import 'package:fire_boot/pages/mine/binding.dart';
import 'package:fire_boot/pages/mine/view.dart';
import 'package:fire_boot/pages/splash/binding.dart';
import 'package:fire_boot/pages/splash/view.dart';
import 'package:fire_boot/pages/topic/binding.dart';
import 'package:fire_boot/pages/topic/view.dart';
import 'package:fire_boot/pages/web_browser/binding.dart';
import 'package:fire_boot/pages/web_browser/view.dart';
import 'package:get/get.dart';

/// @class : Routes
/// @name : alvin
/// @description :页面管理
abstract class Routes {
  ///入口模块
  static const String splashPage = '/splash';

  ///tabber模块
  static const String mainPage = '/main';

  ///登录模块
  static const String loginPage = '/login';

  /// 其他方式登录
  static const String login3rdPage = "/login3rd";

  ///通过输入验证码登陆
  static const String loginByCodePage = '/login/input_code';

  ///入口模块
  static const String msgPage = '/msg';

  ///主页
  static const String homePage = '/home';

  ///webView
  static const String webViewPage = '/webView';

  ///我的
  static const String minePage = '/mine';

  ///比赛
  static const String matchPage = '/match';

  ///发现
  static const String findPage = '/find';

  ///动弹
  static const String topicPage = '/topic';

  ///动弹
  static const String matchDetailPage = '/match/detail';

  ///页面合集
  static final routePage = [
    GetPage(
        name: splashPage,
        page: () => SplashPage(),
        binding: SplashBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: webViewPage,
        page: () => WebBrowserPage(),
        binding: WebBrowserBinding()),
    GetPage(
        name: msgPage, page: () => MessagePage(), binding: MessageBinding()),
    GetPage(name: minePage, page: () => MinePage(), binding: MineBinding()),
    GetPage(
        name: mainPage,
        page: () => MainPage(),
        binding: MainBinding(),
        transition: Transition.noTransition),
    GetPage(
      name: findPage,
      page: () => FindPage(),
      binding: FindBinding(),
    ),
    GetPage(
      name: homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: topicPage,
      page: () => TopicPage(),
      binding: TopicBinding(),
    ),
    GetPage(
      name: matchDetailPage,
      page: () => MatchDetailPage(),
      binding: MatchDetailBinding(),
    ),

  ];
}
