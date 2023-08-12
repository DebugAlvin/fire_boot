import 'package:fire_boot/services/web_browser_service.dart';
import 'package:fire_boot/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:fire_boot/utils/route_util.dart';
import '../../constant/app_values.dart';
import '../../utils/widget_util.dart';
import '../../widget/custom_privacy_policy_dialog.dart';

class PrivacyPolicyService {
  static const SP_PRIVACY_POLICY_CHECK = 'SP_PRIVACY_POLICY_CHECK';

  ///检查隐私协议的状态
  static Future<bool> checkStatus() async {
    //调用本地：
    bool? isAgree = SPUtil().getBool(SP_PRIVACY_POLICY_CHECK);
    //第一次，弹窗是否同意
    if (isAgree == null  || !isAgree) {
      return await PrivacyPolicyService.showPrivacyDialog(WidgetUtil.getCurrentContext()!);
    } else if (isAgree == true) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> showPrivacyDialog(BuildContext context) async {
    bool isAgree = false;
    //弹窗
    await showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (BuildContext ctx) {
        return CustomPrivacyPolicyDialog(
          onConfirm: () async {
            SPUtil().setBool(SP_PRIVACY_POLICY_CHECK, true);
            RouteUtil.popView();
            isAgree = true;
          },
          onCancel: () async {
            SPUtil().setBool(SP_PRIVACY_POLICY_CHECK, false);
            RouteUtil.popView();
            isAgree = false;
          }, onRegister: () {
          WebBrowserService.instance.pushToWebPage('《注册服务协议》', AppValues.registerPolicyUrl);
        }, onPrivater: () {
          WebBrowserService.instance.pushToWebPage('《隐私政策》', AppValues.registerPolicyUrl);
        },
        );
      },
    );
    return isAgree;
  }
}
