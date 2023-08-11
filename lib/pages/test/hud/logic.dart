import 'package:fire_boot/base/getx/base_controller.dart';
import 'package:fire_boot/widget/custom_progress_hud.dart';
import 'package:fire_boot/widget/custom_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TestHUDLogic extends BaseController {


  Future<void>onTestLoading(BuildContext context) async {
    CustomProgressHUD.show(context,content: '正在加载...');
    Future.delayed(const Duration(seconds: 5),(){
      CustomProgressHUD.dismiss(context);
    });
  }

  Future<void>onToast(BuildContext context) async {
    CustomToast.show('测试Toast', context);
  }

}
