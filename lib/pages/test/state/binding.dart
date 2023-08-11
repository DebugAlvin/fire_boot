import 'package:get/get.dart';

import 'logic.dart';

class TestStateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestStateLogic());
  }
}
