import 'package:get/get.dart';

import 'logic.dart';

class TestHUDBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestHUDLogic());
  }
}
