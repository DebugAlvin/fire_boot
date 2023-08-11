import 'package:fire_boot/base/getx/base_controller.dart';
import 'package:fire_boot/utils/widget_util.dart';
import 'package:fire_boot/widget/custom_toast.dart';
import 'package:get/get.dart';

class TestStateLogic extends BaseController {

  Future<void> onTestLoading() async {
    showLoadingPage();
    Future.delayed(const Duration(seconds: 3),(){
      hideStatePage();
    });
  }

  Future<void> onTestNetWorkError() async {
    showErrorPage((){
     // CustomToast.showInCenter(text: '点击重试按钮', context:WidgetUtil.getCurrentContext()!);
      CustomToast.show('点击重试按钮', WidgetUtil.getCurrentContext()!);
    });
    Future.delayed(const Duration(seconds: 5),(){
      hideStatePage();
    });
  }

  Future<void> onTestEmpty() async {
    showEmptyPage();
    Future.delayed(const Duration(seconds: 3),(){
      hideStatePage();
    });
  }


}
