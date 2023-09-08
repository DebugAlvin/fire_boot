import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetUtil {

  static DateTime? _lastClickTime;

  /// give access to currentContext
  static BuildContext? getCurrentContext() {
    return Get.context;
  }

  static double getTopPaddingHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getAppBarHeight(BuildContext context) {
    return AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
  }

  static double getBottomPaddingHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static bool isMultiClick({int intervalMilliseconds = 500}) {
    if (_lastClickTime == null ||
        DateTime.now().difference(_lastClickTime!) >
            Duration(milliseconds: intervalMilliseconds)) {
      _lastClickTime = DateTime.now();
      return false;
    }
    return true;
  }

}
