import 'package:flutter/material.dart';

class CacheKey {
  /// 应用缓存的版本，主要用来判断新特性
  static const String appVersionKey = "app_version_key";

  /// 应用语言
  static const String appLanguageKey = "app_language_key";

  /// 登陆账号
  static const String rawLoginKey = "raw_login_key";

  /// 登陆账号
  static const String userDataKey = "user_data_key";

  static const String tabBarTokenKey = 'tab_bar_token_key';

  /// 网络代理
  static const String appProxy = "app_proxy";

  /// 推送权限
  static const String notificationPermission = "notificationPermission";
}
