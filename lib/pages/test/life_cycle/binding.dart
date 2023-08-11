import 'package:get/get.dart';

import 'logic.dart';

class TestLifeCycleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestLifeCycleLogic());
  }
}
