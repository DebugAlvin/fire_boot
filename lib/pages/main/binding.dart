import 'package:fire_boot/pages/find/logic.dart';
import 'package:fire_boot/pages/find/view.dart';
import 'package:fire_boot/pages/home/logic.dart';
import 'package:fire_boot/pages/message/logic.dart';
import 'package:fire_boot/pages/mine/logic.dart';
import 'package:fire_boot/pages/topic/logic.dart';
import 'package:get/get.dart';
import 'logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLogic>(
          () => MainLogic(),
      // fenix: true,
    );

    Get.lazyPut<HomeLogic>(
          () => HomeLogic(),
      // fenix: true,
    );
    Get.lazyPut<FindLogic>(
          () => FindLogic(),
    );
    Get.lazyPut<MineLogic>(
          () => MineLogic(),
    );
    Get.lazyPut<MessageLogic>(
          () => MessageLogic(),
    );
    Get.lazyPut<TopicLogic>(
          () => TopicLogic(),
    );

  }
}
