import 'package:get/get.dart';

import 'logic.dart';

class TestRefreshBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestRefreshLogic());
  }
}
