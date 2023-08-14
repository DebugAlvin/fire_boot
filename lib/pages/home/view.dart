import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/routes/routes.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'package:fire_boot/widget/button/custom_button.dart';
import 'package:fire_boot/widget/button/custom_icon_button.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:fire_boot/widget/custom_toast.dart';
import 'package:fire_boot/widget/update/custom_update_controller.dart';
import 'package:fire_boot/widget/update/custom_update_dialog.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import 'logic.dart';

class HomePage extends BaseView<HomeLogic> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return const CustomAppBar(
      appBarTitleText: '首页',
      showLeading: false,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return Column(
      children: [
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testButtonPage);
            },
            child: const Text('CustomButton样例')),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testStatePage);
            },
            child: const Text('页面状态样例')),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testCustomStatePage);
            },
            child: const Text('自定义页面状态样例')),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testLifeCyclePage);
            },
            child: const Text('生命周期样例')),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testHUDPage);
            },
            child: const Text('HUD样例')),
        CustomButton(
            onTap: () {
              showCustomUpdateDialog(
                  context: context,
                  title: 'APP更新',
                  remark: '备注',
                  canForceUpdate: true,
                  controller: CustomUpdateController(),
                  onConfirm: () {});
            },
            child: const Text('更新弹窗')),
        CustomButton(
            onTap: () {
              ThemeService().switchTheme(ThemeMode.dark);
            },
            child: const Text('切换到暗黑模式')),

        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.needLoginPage);
            },
            child: const Text('测试拦截器')),
        
        Text('国际化文本：${S.of(context).hello_text}')
      ],
    );
  }
}
