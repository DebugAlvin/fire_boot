/// 使用说明
/// 1：在EventDefine中定义事件id
/// 2：在需要使用的地方进行监听，指定监听的事件id
/// 3: 实现EventListener或则实例化一个EventListener对象也可以
/// 4: 在onEvent中通过事件id进行过滤，针对性的处理你所选择的事件
/// 用例如下：
// class SomeLogic extends GetxController with EventListener {
//
//   @override
//   onInit() {
//     /// 添加事件监听
//     EventService.instance.addListener(EventDefine.themeChange, this);
//     super.onInit();
//   }
//
//   @override
//   onClose() {
//     /// 移除事件监听
//     EventService.instance.removeListener(EventDefine.themeChange, this);
//     super.onClose();
//   }
//
//   @override
//   onEvent(EventDefine eventId, dynamic event) {
//     switch(eventId) {
//       case EventDefine.themeChange: {
//         /// 处理主题切换事件
//         break;
//       }
//     }
//   }
//
// }

enum EventDefine {
  testNumberPlus,
  themeChange,
}

abstract class EventListener {
  void onEvent(EventDefine eventId, dynamic event);
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

  final listeners = <EventDefine, List<EventListener>>{};

  void addListener(EventDefine eventId, EventListener listener) {
    if (listeners.containsKey(eventId)) {
      listeners[eventId]!.add(listener);
    } else {
      listeners[eventId] = [listener];
    }
  }

  void removeListener(EventDefine? eventId, EventListener listener) {
    if (eventId == null) {
      listeners.forEach((key, value) {
        value.remove(listener);
      });
    } else {
      listeners[eventId]?.remove(listener);
    }
  }

  void dispatchEvent(EventDefine eventId, [dynamic data]) {
    if (listeners.containsKey(eventId)) {
      for (var element in listeners[eventId]!) {
        element.onEvent(eventId, data);
      }
    }
  }

}