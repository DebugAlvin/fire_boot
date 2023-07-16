import 'dart:math';

import 'package:fire_boot/utils/sp_util.dart';

class DeviceService {

  static DeviceService? _instance;

  static DeviceService _getInstance() {
    _instance ??= DeviceService();
    return _instance!;
  }

  static DeviceService get instance => _getInstance();


  String getDeviceId()  {
    var deviceId =  SPUtil().get<String>('flutter_device_id');
    if(deviceId == null) {
      deviceId = _generateRandomString(32);
      SPUtil().setString('flutter_device_id', deviceId);
    }
    return deviceId ?? '';
  }


  String _generateRandomString(int length) {
    final random = Random();
    const availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length,
            (index) => availableChars[random.nextInt(availableChars.length)])
        .join();

    return randomString;
  }


}