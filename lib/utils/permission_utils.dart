import 'package:flutter/foundation.dart';
import 'package:flutter_ulog/flutter_ulog.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {

  /// 检测是否有权限
  /// [permission] 权限类型
  /// [onSuccess] 成功
  /// [onFailed] 失败
  /// [goSetting] 前往设置 插件虽然提供了一个跳转设置的方法不过也可以自定义
  static Future<void> checkPermission(
      {required Permission permission,
        VoidCallback? onSuccess,
        VoidCallback? onFailed,
        VoidCallback? goSetting}) async {

    bool isGranted = true;
    PermissionStatus status = await permission.status;
    ///如果不是允许状态就添加到新的申请列表中
    if (!status.isGranted) {
      isGranted = false;
    }
    ///获取权限失败，我们就去申请权限，否则执行onSuccess回调
    if (!isGranted) {
      PermissionStatus permissionStatus =
      await _requestPermission([permission]);
      switch (permissionStatus) {
      ///拒绝状态
        case PermissionStatus.denied:
          onFailed != null ? onFailed() : ULog.i('用户拒绝了权限申请');
          break;
      ///允许状态
        case PermissionStatus.granted:
          onSuccess != null ? onSuccess() : ULog.i('用户允许了权限申请');;
          break;
      /// 永久拒绝  活动限制
        case PermissionStatus.restricted:
        case PermissionStatus.limited:
      ///用户在系统设置里面禁用了权限，我们跳转到系统设置页提示用户允许权限
        case PermissionStatus.permanentlyDenied:
          goSetting != null
              ? goSetting()
              : openAppSettings();
          break;
      }
    } else {
      onSuccess != null ? onSuccess() : ULog.i('权限申请成功');
    }
  }


  /// 获取新列表中的权限 如果有一项不合格就返回false
  static Future<PermissionStatus> _requestPermission(List<Permission> permissionList) async {
    Map<Permission, PermissionStatus> statuses = await permissionList.request();
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    statuses.forEach((key, value) {
      if (!value.isGranted) {
        currentPermissionStatus = value;
        return;
      }
    });
    return currentPermissionStatus;
  }
}