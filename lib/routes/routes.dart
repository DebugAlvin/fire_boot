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
import 'package:fire_boot/pages/test/button/binding.dart';
import 'package:fire_boot/pages/test/button/view.dart';
import 'package:fire_boot/pages/test/custom_state/binding.dart';
import 'package:fire_boot/pages/test/custom_state/view.dart';
import 'package:fire_boot/pages/test/life_cycle/binding.dart';
import 'package:fire_boot/pages/test/life_cycle/view.dart';
import 'package:fire_boot/pages/test/state/binding.dart';
import 'package:fire_boot/pages/test/state/view.dart';
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

  ///测试CustomButton
  static const String testButtonPage = '/test/button';

  ///测试状态页面
  static const String testStatePage = '/test/state';

  ///测试自定义状态页面
  static const String testCustomStatePage = '/test/custom_state';

  ///测试生命周期
  static const String testLifeCyclePage = '/test/life_cycle';

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
    GetPage(
      name: testButtonPage,
      page: () => TestButtonPage(),
      binding: TestButtonBinding(),
    ),
    GetPage(
      name: testStatePage,
      page: () => TestStatePage(),
      binding: TestStateBinding(),
    ),
    GetPage(
      name: testCustomStatePage,
      page: () => TestCustomStatePage(),
      binding: TestCustomStateBinding(),
    ),
    GetPage(
      name: testLifeCyclePage,
      page: () => TestLifeCyclePage(),
      binding: TestLifeCycleBinding(),
    ),

  ];
}
