import 'package:get/get.dart';

import 'logic.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageLogic());
  }
}
