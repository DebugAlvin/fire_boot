import 'package:get/get.dart';

import 'logic.dart';

class TestCustomStateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestCustomStateLogic());
  }
}
