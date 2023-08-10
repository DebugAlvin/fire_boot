import 'package:fire_boot/base/getx/base_controller.dart';
import 'package:fire_boot/services/event2/event_service.dart';
import 'package:fire_boot/utils/widget_util.dart';
import 'package:fire_boot/widget/custom_toast.dart';
import 'package:get/get.dart';

const kDidArticleCollectEvent = 'kDidArticleCollectEvent';

class HomeLogic extends BaseController with EventListener {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    EventService.instance.addListener(kDidArticleCollectEvent, this);
  }

  @override
  void onEvent(String eventId, event) {
    // TODO: implement onEvent
    if (eventId == kDidArticleCollectEvent) {
      print('跨页面传参：$event');
    }
  }

  @override
  onClose() {
    /// 移除事件监听
    EventService.instance.removeListener(kDidArticleCollectEvent, this);
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

  }

}
