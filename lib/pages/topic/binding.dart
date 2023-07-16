import 'package:get/get.dart';

import 'logic.dart';

class TopicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopicLogic());
  }
}
