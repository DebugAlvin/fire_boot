import 'package:get/get.dart';

import 'logic.dart';

class TestTextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestTextLogic());
  }
}
