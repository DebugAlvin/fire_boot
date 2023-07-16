import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WidgetUtils {
  /// give access to currentContext
  static BuildContext? getCurrentContext(){
    return Get.context;
  }
}