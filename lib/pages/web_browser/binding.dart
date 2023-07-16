import 'package:get/get.dart';

import 'logic.dart';

class WebBrowserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebBrowserLogic());
  }
}
