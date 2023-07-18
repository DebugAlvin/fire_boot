import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/routes/routes.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'package:fire_boot/widget/custom_app_bar.dart';
import 'package:fire_boot/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';

class HomePage extends BaseView<HomeLogic> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return CustomAppBar(appBarTitleText: '首页',showLeading: false,);
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return Column(
      children: [
        // CustomAppBar(appBarTitleText: '首页1',showLeading: false,),
        CustomButton(
            onPressed: (){
              RouteUtil.pushToView(Routes.matchDetailPage);
            },
            child: const Text('点击下一页（正常导航栏）')),
        CustomButton(
            onPressed: (){
              RouteUtil.pushToView(Routes.matchDetailPage);
            },
            child: const Text('点击下一页（透明导航栏）')),
      ],
    );
  }

}
