import 'dart:io';
import 'package:fire_boot/base/getx/base_controller.dart';
import 'package:fire_boot/services/privacy_policy/privacy_policy_service.dart';
import 'package:fire_boot/widget/custom_confirm_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashLogic extends BaseController {
  late Function onFinish;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    onFinish();
    return;

    // showPrivacyDialog();
  }

  void showPrivacyDialog() async {
    final isPass = await PrivacyPolicyService.checkStatus();
    if (kDebugMode) {
      print("隐私协议弹窗状态：$isPass");
    }
    if(isPass) {
      onFinish();
    } else {
      Get.dialog(CustomConfirmDialog(
          content: '不同意隐私协议无法使用App，确认退出吗？',
          onConfirm: () => exit(0),
          onCancel: () => showPrivacyDialog()
      ));
    }
  }

  void _delayedLoad() async {}


}
