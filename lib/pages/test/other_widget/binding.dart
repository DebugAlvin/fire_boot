import 'package:get/get.dart';

import 'logic.dart';

class TestOtherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestOtherLogic());
  }
}
