import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteUtil {
  static void pushToView(
    String pagName, {
    dynamic arguments, bool offAll = false,bool offLast = false, ValueChanged<dynamic>? onBack
  }) {
    if(offAll == true) {
      Get.offAllNamed(pagName,arguments: arguments)?.then((value) {
        if(onBack != null) {
          onBack(value);
        }
      });
    }else if(offLast == true) {
      Get.offNamed(pagName,arguments: arguments)?.then((value) {
        if(onBack != null) {
          onBack(value);
        }
      });
    }else{
      Get.toNamed(pagName,arguments: arguments)?.then((value) {
        if(onBack != null) {
          onBack(value);
        }
      });
    }
  }

  static void popView({ dynamic result }) {
    Get.back(result: result);
  }
}
