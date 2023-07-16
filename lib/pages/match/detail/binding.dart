import 'package:get/get.dart';

import 'logic.dart';

class MatchDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchDetailLogic());
  }
}
