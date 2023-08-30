import 'package:fire_boot/services/event/event_service.dart';
import 'package:fire_boot/services/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fire_boot/utils/sp_util.dart';
import '../../constant/app_button_style.dart';
import '../../constant/app_themes.dart';
import '../../constant/app_values.dart';
import 'custom_button_theme_data.dart';
import 'custom_color_scheme.dart';

/// @class : AppThemes
/// @date : 2023/01/06
/// @name : alvin
/// @description :AppThemes主题颜色配置:
/// @init 无论如何初始化，取到的都是同一个对象
/// ThemeService service1 = ThemeService();
/// ThemeService service2 = ThemeService.instance;
/// ThemeService service3 = ThemeService();
/// ThemeService service4 = ThemeService.instance;
/// print(identical(service1, service2)); //true
/// print(identical(service1, service3)); //true
/// print(identical(service3, service4)); //true
/// ThemeData 详解：
/// https://www.jianshu.com/p/2f4b5119d770
/// FlutterComponent最佳实践之色彩管理:
/// https://cloud.tencent.com/developer/article/1970163
/// PrimaryColor、SecondaryColor、AccentColor的区别和理解：
/// https://www.cnblogs.com/yongfengnice/p/13867706.html

class ThemeService {
  factory ThemeService() => _getInstance();

  static ThemeService get instance => _getInstance();

  // 静态私有成员，没有初始化
  static ThemeService? _instance;

  // 私有构造函数
  ThemeService._internal() {
    // 初始化
    final colorValue = _loadThemeColorFromBox();
    primaryColor = colorValue;
  }

  // 静态、同步、私有访问点
  static ThemeService _getInstance() {
    _instance ??= ThemeService._internal();
    return _instance!;
  }

  late Color primaryColor;
  final _box = SPUtil();
  final _key = 'ThemeMode';
  final _colorKey = 'ThemeColor';

  ///用户没有在App设置过主题方案时的默认配置方案，这里设置了Dark，
  ///通常情况下大部分App应该使用Get.isDarkMode ? AppThemes.dark : AppThemes.light，
  ///使用系统的配置。
  final _defaultMode = ThemeMode.light;

  /// 工厂模式 : 单例公开访问点
  /// 无论如何初始化，取到的都是同一个对象
  ///   ThemeService service1 = new ThemeService();
  ///   ThemeService service2 = ThemeService.instance;
  ///   ThemeService service3 = new ThemeService();
  ///   ThemeService service4 = ThemeService.instance;
  /// ————————————————

  ThemeMode get themeMode {
    int? themeMode = _loadThemeFromBox();
    //用户还没设置过主题方案时我们使用常量设置默认配置
    //另外，用户拒绝访问存储权限或者用户第一次打开app还没同意隐私政策弹窗
    //也有可能themeMode == null
    if (themeMode == null) {
      return _defaultMode;
    } else if (themeMode == ThemeMode.system.index) {
      //用户在APP选择了"跟随系统"
      return Get.isDarkMode ? ThemeMode.system : ThemeMode.light;
    } else if (themeMode == ThemeMode.dark.index) {
      //用户在APP设置了暗黑模式
      return ThemeMode.dark;
    } else {
      //用户在APP选择明亮模式
      return ThemeMode.light;
    }
  }

  List<ThemeColor> get themeColors {
    return AppThemes.primaryColors;
  }

  bool get isDarkMode => Get.isDarkMode;

  ///获取当前的主题
  ThemeData get theme {
    ThemeMode themeMode = this.themeMode;
    if (themeMode == ThemeMode.system) {
      return Get.isDarkMode ? darkTheme : lightTheme;
    } else if (themeMode == ThemeMode.dark) {
      return darkTheme;
    } else {
      return lightTheme;
    }
  }

  /// 获取用户暗黑模式设置的缓存配置
  int? _loadThemeFromBox() => _box.get(_key);

  /// 保存用户暗黑模式设置
  _saveThemeToBox(int themeMode) => _box.setInt(_key, themeMode);

  /// 获取用户暗黑模式设置的缓存配置
  Color _loadThemeColorFromBox() {
    String? label = _box.get(_colorKey);
    if (label != null) {
      for (ThemeColor color in AppThemes.primaryColors) {
        if (color.key == label) {
          return color.value;
        }
      }
    }
    return AppThemes.primaryColors[0].value;
  }

  /// 保存用户暗黑模式设置
  _saveThemeColorToBox(String label) => _box.setString(_colorKey, label);

  /// 更新主题
  void _updateTheme() {
    Future.delayed(const Duration(milliseconds: 250), () {
      Get.forceAppUpdate();
    });
  }

  /// 切换主题
  Future<void> switchTheme(ThemeMode mode) async {
    // Get.changeThemeMode(mode);
    _saveThemeToBox(mode.index);

    /// 然后使用GetX 提供的切换方式,进行动态更新就可以
    Get.changeThemeMode(mode);
    Get.changeTheme(theme);

    /// 这个比较重要,如果不使用这个,可能会导致主题没有及时更新
    _updateTheme();
  }

  /// 切换主题颜色
  Future<void> switchThemeColor(ThemeColor color) async {
    await _saveThemeColorToBox(color.key);
    primaryColor = color.value;
    Get.changeThemeMode(themeMode);
    Get.changeTheme(theme);
    /// 这个比较重要,如果不使用这个,可能会导致主题没有及时更新
    _updateTheme();
  }


  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      // backgroundColor: AppThemes.cardColorLight, /废弃，使用colorScheme.background
      colorScheme: CustomColorScheme.defaultColorScheme(isDark: false),
      scaffoldBackgroundColor: AppThemes.pageLightBackground,
      primaryColor: ThemeService.instance.primaryColor,
      shadowColor: AppThemes.colorShadow,
      focusColor: AppThemes.colorAccent,
      dividerColor: AppThemes.dividerColor,
      hintColor: AppThemes.hintColor,
      buttonTheme: CustomButtonThemeData.defaultTheme(
          CustomColorScheme.defaultColorScheme(isDark: false)),
      dividerTheme: const DividerThemeData(
        color: AppThemes.dividerColor,
        indent: AppValues.defaultPadding,
        endIndent: AppValues.defaultPadding,
      ),
      textButtonTheme: TextButtonThemeData(
        style: AppButtonStyles.getTransparentStyle(),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppThemes.appBarColorWhite,
        iconTheme: IconThemeData(color: AppThemes.appBarIconColorDark),
        titleTextStyle:
        TextStyle(color: AppThemes.appBarIconColorDark, fontSize: 16),
      ),
      // 文本的颜色与卡片和画布的颜色形成对比
      textTheme: ThemeService.textTheme(false),
      // 与primaryColor形成对比的文本主题,可以直接使用暗黑模式的配置
      primaryTextTheme: ThemeService.textTheme(false),
      //tabbr
      tabBarTheme: ThemeService.tabBarTheme(false),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: CustomColorScheme.defaultColorScheme(isDark: true),
      scaffoldBackgroundColor: AppThemes.pageDarkBackground,
      primaryColor: ThemeService.instance.primaryColor,
      shadowColor: AppThemes.colorShadow,
      focusColor: AppThemes.colorAccent,
      hintColor: AppThemes.hintColor,
      dividerColor: AppThemes.dividerColor,
      buttonTheme: CustomButtonThemeData.defaultTheme(
          CustomColorScheme.defaultColorScheme(isDark: true)),
      dividerTheme: const DividerThemeData(
        color: AppThemes.dividerColor,
        indent: AppValues.defaultPadding,
        endIndent: AppValues.defaultPadding,
      ),
      textButtonTheme: TextButtonThemeData(
        style: AppButtonStyles.getTransparentStyle(),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppThemes.appBarColorDark,
        iconTheme: IconThemeData(color: AppThemes.appBarIconColorWhite),
        titleTextStyle:
        TextStyle(color: AppThemes.appBarTextColorWhite, fontSize: 16),
      ),
      // 文本的颜色与卡片和画布的颜色形成对比
      textTheme: ThemeService.textTheme(true),
      // 与primaryColor形成对比的文本主题,可以直接使用暗黑模式的配置
      primaryTextTheme: ThemeService.textTheme(false),
      tabBarTheme: ThemeService.tabBarTheme(true),
    );
  }


  /// @method : textTheme
  /// @description :AppTextStyles文本主题颜色配置
  /// TextTheme详细解，http://t.zoukankan.com/sundaysme-p-13545038.html
  /// 以下是2018的设计规范，在2021中已经弃用，不要混用！
  /// NAME         SIZE  WEIGHT  SPACING
  /// headline1    96.0  light   -1.5
  /// headline2    60.0  light   -0.5
  /// headline3    48.0  regular  0.0
  /// headline4    34.0  regular  0.25
  /// headline5    24.0  regular  0.0
  /// headline6    20.0  medium   0.15
  /// subtitle1    16.0  regular  0.15
  /// subtitle2    14.0  medium   0.1
  /// body1        16.0  regular  0.5   (bodyText1)
  /// body2        14.0  regular  0.25  (bodyText2)
  /// button       14.0  medium   1.25
  /// caption      12.0  regular  0.4
  /// overline     10.0  regular  1.5
  static TextTheme textTheme(bool isDark) {
    return const TextTheme().copyWith(
      ///title，一般用于card widget的标题
      titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),
      titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),
      titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),

      ///body，正文内容，一般用于商品详情介绍
      bodySmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),
      bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),
      bodyLarge: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),

      ///作为屏幕上最大的文本，
      ///重要的文本或数字
      displayLarge: TextStyle(
          fontSize: 112,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),

      displayMedium: TextStyle(
          fontSize: 56,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),

      displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),

      ///小于display样式大于title样式
      ///在较小屏幕上显示简短、高度强调的文本。
      headlineSmall: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),

      headlineMedium: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),

      headlineLarge: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.normal,
          color: isDark
              ? AppThemes.textPrimaryColorWhite
              : AppThemes.textPrimaryColorDark),

      ///最小的文字
      labelSmall: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: AppThemes.lightGray),

      /// 用于与图像关联的辅助文本,最大号
      labelLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppThemes.textColorSecondary),

      ///用于与图像关联的辅助文本。
      labelMedium: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppThemes.textColorSecondary),
    );
  }

  /// @method : textTheme
  /// @description :tabbar主题
  static TabBarTheme tabBarTheme(bool isDark) {
    return const TabBarTheme().copyWith(
      labelColor: isDark
          ? AppThemes.textPrimaryColorWhite
          : AppThemes.textPrimaryColorDark,
      unselectedLabelColor: AppThemes.textColorSecondary,
      labelStyle: const TextStyle(
        fontSize: 15,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 15,
      ),
    );
  }
}
