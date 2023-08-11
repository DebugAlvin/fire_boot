import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/routes/routes.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'package:fire_boot/widget/button/custom_button.dart';
import 'package:fire_boot/widget/button/custom_icon_button.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:fire_boot/widget/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      ],
    );
  }
}
