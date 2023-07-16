import 'package:get/get.dart';
import 'logic.dart';

class FindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindLogic());
  }
}
