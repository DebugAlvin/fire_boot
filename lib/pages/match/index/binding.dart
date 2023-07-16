import 'package:get/get.dart';

import 'logic.dart';

class MatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchLogic());
  }
}
