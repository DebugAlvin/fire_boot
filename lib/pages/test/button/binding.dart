import 'package:get/get.dart';

import 'logic.dart';

class TestButtonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestButtonLogic());
  }
}
