import 'dart:io';
import 'package:fire_boot/base/getx/base_controller.dart';
import 'package:fire_boot/services/privacy_policy/privacy_policy_service.dart';
import 'package:fire_boot/widget/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
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
    // onFinish();
    // return;
    ////SPUtil需要一点时间初始化
    Future.delayed(const Duration(microseconds: 200),(){
      showPrivacyDialog();
    });

  }

  Future<void> showPrivacyDialog() async {
    final isPass = await PrivacyPolicyService.checkStatus();
    if (kDebugMode) {
      print("隐私协议弹窗状态：$isPass");
    }
    if (isPass) {
      onFinish();
      return;
    }
  }

  void _delayedLoad() async {}
}
