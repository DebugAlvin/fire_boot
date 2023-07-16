import 'package:flutter_ulog/flutter_ulog.dart';

class ULogService {
  static ULogService? _instance;

  static ULogService _getInstance() {
    _instance ??= ULogService();
    return _instance!;
  }

  static ULogService get instance => _getInstance();


  ULogService(){
    ULog.addLogAdapter(ConsoleAdapter());
  }

}

class ConsoleAdapter extends ULogConsoleAdapter {
  @override
  bool isLoggable(ULogType type, String? tag) => true;
}
