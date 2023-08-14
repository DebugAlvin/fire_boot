import 'package:get/get.dart';

import 'logic.dart';

class NeedLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NeedLoginLogic());
  }
}
