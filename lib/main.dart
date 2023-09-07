import 'package:fire_boot/pages/splash/binding.dart';
import 'package:fire_boot/pages/splash/view.dart';
import 'package:fire_boot/routes/routes.dart';
import 'package:fire_boot/services/account_service.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/services/ulog_service.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'package:fire_boot/utils/sp_util.dart';
import 'package:fire_boot/widget/custom_route_listen_widget.dart';
import 'package:fire_boot/widget/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ///SPUtil必须启动时预初始化
  await SPUtil.perInit();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ///根据设计稿，设置默认的主题
    ThemeService.instance.initTheme(ThemeMode.dark);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Container(
      decoration: BoxDecoration(

      ),
    );
    return _buildMaterialApp();
  }

  Widget _buildMaterialApp() {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [CustomRouteListenWidget.routeObserver,CustomGlobalNavigatorObserver()],
      initialRoute: '/',
      getPages: [...Routes.routePage],
      theme: ThemeService.instance.lightTheme,
      darkTheme: ThemeService.instance.darkTheme,
      themeMode: ThemeService.instance.themeMode,
      defaultTransition: Transition.cupertino,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialBinding: SplashBinding(),
      home: SplashPage(
        onFinish: (context) async {
          _initThirdSDK();
          await AccountService().initAsync();
          Future.delayed(const Duration(seconds: 1), () {
            RouteUtil.pushToView(Routes.mainPage, offAll: true);
          });
        },
      ),
    );
  }
}

void _initThirdSDK() async {
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


class CustomGlobalNavigatorObserver extends NavigatorObserver{

  @override
  void didPop(Route route, Route? previousRoute) {
    // TODO: implement didPop
    super.didPop(route, previousRoute);
    CustomToast.dismiss();
  }
}