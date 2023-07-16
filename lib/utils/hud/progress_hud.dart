import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProgressHUD {
  static TransitionBuilder builder() {
    return EasyLoading.init(builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child!,
      );
    });
  }

  static void showLoading(String msg) {
    EasyLoading.show(
        status: msg, maskType: EasyLoadingMaskType.black, dismissOnTap: false);
  }

  static void showSuccess(String msg) {
    EasyLoading.showSuccess(msg,
        maskType: EasyLoadingMaskType.black, dismissOnTap: false);
  }

  static void showError(String msg) {
    EasyLoading.showError(msg,
        maskType: EasyLoadingMaskType.black, dismissOnTap: false);
  }

  static Future<void> showProgress( double value, {
    String? status,
  }) {
    return EasyLoading.showProgress(value,status: status,maskType: EasyLoadingMaskType.black);
  }

  static void showInfo(String msg) {
    EasyLoading.showInfo(msg,
        maskType: EasyLoadingMaskType.black, dismissOnTap: false);
  }

  static void showToast(String msg) {
    EasyLoading.showToast(msg,
        toastPosition: EasyLoadingToastPosition.bottom, dismissOnTap: false);
  }

  static Future<void> dismiss() async {
    await EasyLoading.dismiss();
  }
}
