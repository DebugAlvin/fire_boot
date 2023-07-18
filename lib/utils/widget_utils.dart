import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetUtils {
  /// give access to currentContext
  static BuildContext? getCurrentContext() {
    return Get.context;
  }

  static double getAppBarHeight(BuildContext context) {
    return AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
  }
}
