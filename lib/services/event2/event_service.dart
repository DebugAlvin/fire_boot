/// 使用说明
/// 1：在eventId中定义事件id
/// 2：在需要使用的地方进行监听，指定监听的事件id
/// 3: 实现EventListener或则实例化一个EventListener对象也可以
/// 4: 在onEvent中通过事件id进行过滤，针对性的处理你所选择的事件
/// 用例如下：
///
///
// const kDidArticleCollectEvent = 'kDidArticleCollectEvent';
// 跨页面发送事件
// Future<void> onArticleCollect() async {
//   EventService.instance.dispatchEvent(kDidArticleCollectEvent,'跨页面传参');
// }
//
//
// class HomeLogic extends BaseController with EventListener {
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     EventService.instance.addListener(kDidArticleCollectEvent, this);
//   }
//
//   @override
//   void onEvent(String eventId, event) {
//     // TODO: implement onEvent
//     if (eventId == kDidArticleCollectEvent) {
//       print('跨页面传参：$event');
//     }
//   }
//
//   @override
//   onClose() {
//     /// 移除事件监听
//     EventService.instance.removeListener(kDidArticleCollectEvent, this);
//     super.onClose();
//   }
//
//   @override
//   void onReady() {
//     // TODO: implement onReady
//     super.onReady();
//   }
//
// }


abstract class EventListener {
  void onEvent(String eventId, dynamic event);
}

class EventService {

  EventService._();
  static EventService? _instance;
  static EventService _getInstance() {
    _instance ??= EventService._();
    return _instance!;
  }
  static EventService get instance => _getInstance();
  factory EventService() => _getInstance();

  final listeners = <String, List<EventListener>>{};

  void addListener(String eventId, EventListener listener) {
    if (listeners.containsKey(eventId)) {
      listeners[eventId]!.add(listener);
    } else {
      listeners[eventId] = [listener];
    }
  }

  void removeListener(String? eventId, EventListener listener) {
    if (eventId == null) {
      listeners.forEach((key, value) {
        value.remove(listener);
      });
    } else {
      listeners[eventId]?.remove(listener);
    }
  }

  void dispatchEvent(String eventId, [dynamic data]) {
    if (listeners.containsKey(eventId)) {
      for (var element in listeners[eventId]!) {
        element.onEvent(eventId, data);
      }
    }
  }

}