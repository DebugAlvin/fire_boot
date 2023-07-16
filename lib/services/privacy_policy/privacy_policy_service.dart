import 'package:fire_boot/services/web_browser_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fire_boot/utils/route_util.dart';
import '../../constant/app_values.dart';
import '../../utils/widget_utils.dart';
import 'privacy_policy_dialog.dart';

class PrivacyPolicyService {
  static const SP_PRIVACY_POLICY_CHECK = 'SP_PRIVACY_POLICY_CHECK';

  ///检查隐私协议的状态
  static Future<bool> checkStatus() async {
    //调用本地：
    final pref = await SharedPreferences.getInstance();
    bool? isAgree = pref.getBool(SP_PRIVACY_POLICY_CHECK);
    //第一次，弹窗是否同意
    if (isAgree == null || !isAgree || WidgetUtils.getCurrentContext() != null) {
      return await PrivacyPolicyService.showPrivacyDialog(WidgetUtils.getCurrentContext()!);
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
        return PrivacyPolicyDialog(
          onConfirm: () async {
            final pref = await SharedPreferences.getInstance();
            await pref.setBool(SP_PRIVACY_POLICY_CHECK, true);
            RouteUtil.popView();
            isAgree = true;
          },
          onCancel: () async {
            final pref = await SharedPreferences.getInstance();
            await pref.setBool(SP_PRIVACY_POLICY_CHECK, false);
            RouteUtil.popView();
            isAgree = false;
            // final pref = await SharedPreferences.getInstance();
            // await pref.setBool(SP_PRIVACY_POLICY_CHECK, true);
            // RouteUtil.popView();
            // isAgree = true;
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
