import 'package:fire_boot/services/event/event_service.dart';
import 'custom_update_dialog.dart';

class CustomUpdateController {

  var progress = 0.0;
  var stateText = '当前下载状态：还未开始';
  var startDownLoad = false;

  Future<void> setProgress(double progress) async {
    this.progress = progress;
    EventService.instance.dispatchEvent(kAppUpdateProgressEvent);
  }

  Future<void> setStateText(String text) async {
    stateText = text;
  }

  Future<void> setStartDownLoad(bool startDownLoad) async {
    this.startDownLoad = startDownLoad;
    EventService.instance.dispatchEvent(kAppUpdateProgressEvent);
  }

}