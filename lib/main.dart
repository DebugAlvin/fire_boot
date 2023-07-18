import 'package:easy_refresh/easy_refresh.dart';
import 'package:fire_boot/pages/splash/binding.dart';
import 'package:fire_boot/pages/splash/view.dart';
import 'package:fire_boot/routes/routes.dart';
import 'package:fire_boot/services/app_http/account_service.dart';
import 'package:fire_boot/services/theme_service.dart';
import 'package:fire_boot/services/ulog_service.dart';
import 'package:fire_boot/utils/hud/progress_hud.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'package:fire_boot/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'constant/app_values.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initUI();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorObservers: [RouteObserver()],
    initialRoute: '/',
    getPages: [...Routes.routePage],
    theme: ThemeService.lightTheme,
    darkTheme: ThemeService.darkTheme,
    themeMode: ThemeService.instance.themeMode,
    //默认使用暗黑模式
    defaultTransition: Transition.cupertino,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('zh'),
      Locale('en'),
    ],
    locale: const Locale('zh', 'CN'),
    initialBinding: SplashBinding(),
    home: SplashPage(
      onFinish: (context) async {
        _initThirdSDK();
        await AccountService().initAsync();
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        Future.delayed(const Duration(seconds: 1), () {
          RouteUtil.pushToView(Routes.mainPage, offAll: true);
        });

        // await LunchConfigService.instance.init(() {
        //   ///后端说一定要等启动配置服务请求成功后3秒才能获取im
        //   Future.delayed(const Duration(seconds: 3),(){
        //     ImService.instance.login();
        //   });
        // });
      },
    ),
    builder: ProgressHUD.builder(),
  ));
}

void _initThirdSDK() async {
  SPUtil.perInit();
  ULogService.instance;
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //请求获取设备id需要的权限，iOS-ATT广告追踪，Android-根据系统版本oaid或者imie
  // final success = await FlutterAdvertisingId.requestPermissionIfNecessary();
  // ULog.i("请求获取设备id需要的权限：$success");
  // final deviceId = await FlutterAdvertisingId.getDeviceId();
  // ULog.i("设备id：$deviceId");

  // PushService.instance.initSDK(AppValues.jPushKey, AppValues.channel);
  // Future.delayed(const Duration(seconds: 1), () {
  //   RouteUtil.pushToView(Routes.mainPage, offAll: true);
  // });

  //   if (flag) {
  //     _showSplashAdView();
  //   } else {
  //     RouteUtil.pushToView(Routes.mainPage, offAll: true);
  //   }
  // });
}

void _showSplashAdView() {
  // showDialog(
  //   context: WidgetUtils.getCurrentContext()!,
  //   barrierDismissible: false,
  //   barrierColor: Colors.transparent,
  //   useRootNavigator: false,
  //   useSafeArea: false,
  //   builder: (BuildContext ctx) {
  //     return AdsWidget(
  //       bottomHeight: bottomHeight,
  //       splashId: AppValues.pangle_splashId,
  //       onFinish: () {
  //         RouteUtil.pushToView(Routes.mainPage, offAll: true);
  //       },
  //     );
  //   },
  // );
}

void _initUI() {
// 全局设置
  EasyRefresh.defaultHeaderBuilder =
      () => const ClassicHeader(showText: false, showMessage: false);
  EasyRefresh.defaultFooterBuilder = () => const ClassicFooter(
      showText: false,
      showMessage: false,
      succeededIcon: SizedBox(),
      failedIcon: SizedBox(),
      noMoreIcon: SizedBox());
}