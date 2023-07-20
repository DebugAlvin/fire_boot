import 'package:fire_boot/base/getx/base_controller.dart';
import 'package:fire_boot/pages/home/logic.dart';
import 'package:fire_boot/services/event2/event_service.dart';
import 'package:get/get.dart';

class MatchDetailLogic extends BaseController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> onArticleCollect() async {
    EventService.instance.dispatchEvent(kDidArticleCollectEvent,'跨页面传参');
  }

}
