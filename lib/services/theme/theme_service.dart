import 'package:fire_boot/services/event/event_service.dart';
import 'package:fire_boot/services/theme/custom_bottom_navigation_bar_theme_data.dart';
import 'package:fire_boot/services/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fire_boot/utils/sp_util.dart';
import '../../constant/app_button_style.dart';
import '../../constant/app_themes.dart';
import '../../constant/app_values.dart';
import 'custom_app_bar_theme.dart';
import 'custom_button_theme_data.dart';
import 'custom_color_scheme.dart';
import 'custom_text_theme.dart';

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
  late ThemeMode _defaultMode;

  /// 工厂模式 : 单例公开访问点
  /// 无论如何初始化，取到的都是同一个对象
  ///   ThemeService service1 = new ThemeService();
  ///   ThemeService service2 = ThemeService.instance;
  ///   ThemeService service3 = new ThemeService();
  ///   ThemeService service4 = ThemeService.instance;
  /// ————————————————

  initTheme(ThemeMode mode) {
    _defaultMode = mode;
  }

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
    final colorScheme = CustomColorScheme.defaultColorScheme(isDark: false);
    final textTheme = CustomTextTheme.defaultTheme(isDark: false);
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppThemes.pageLightBackground,
      primaryColor: ThemeService.instance.primaryColor,
      shadowColor: AppThemes.colorShadow,
      dividerColor: AppThemes.dividerColor,
      iconTheme: const IconThemeData(
          color: AppThemes.iconColor, size: AppValues.iconDefaultSize),
      buttonTheme: CustomButtonThemeData.defaultTheme(
          colorScheme: colorScheme, isDark: false),
      dividerTheme:  DividerThemeData(
        color: AppThemes.dividerColor,
        indent: AppValues.defaultPadding,
        endIndent: AppValues.defaultPadding,
      ),
      textButtonTheme: TextButtonThemeData(
        style: AppButtonStyles.getTransparentStyle(),
      ),

      appBarTheme: CustomAppBarTheme.defaultTheme(colorScheme: colorScheme),
      // 文本的颜色与卡片和画布的颜色形成对比
      textTheme: textTheme,
      bottomNavigationBarTheme: CustomBottomNavigationBarThemeData.defaultTheme(
        colorScheme: colorScheme,
      ),
    );
  }

  ThemeData get darkTheme {
    final colorScheme = CustomColorScheme.defaultColorScheme(isDark: true);
    final textTheme = CustomTextTheme.defaultTheme(isDark: true);
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppThemes.pageDarkBackground,
      primaryColor: ThemeService.instance.primaryColor,
      shadowColor: AppThemes.colorShadow,
      dividerColor: AppThemes.dividerColor,
      iconTheme: const IconThemeData(
          color: AppThemes.iconColor, size: AppValues.iconDefaultSize),
      buttonTheme: CustomButtonThemeData.defaultTheme(
          colorScheme: colorScheme, isDark: true),
      dividerTheme:  DividerThemeData(
        color: AppThemes.dividerColor,
        indent: AppValues.defaultPadding,
        endIndent: AppValues.defaultPadding,
      ),
      textButtonTheme: TextButtonThemeData(
        style: AppButtonStyles.getTransparentStyle(),
      ),
      appBarTheme: CustomAppBarTheme.defaultTheme(colorScheme: colorScheme),
      // 文本的颜色与卡片和画布的颜色形成对比
      textTheme: textTheme,
      bottomNavigationBarTheme: CustomBottomNavigationBarThemeData.defaultTheme(
          colorScheme: colorScheme),
    );
  }
}
